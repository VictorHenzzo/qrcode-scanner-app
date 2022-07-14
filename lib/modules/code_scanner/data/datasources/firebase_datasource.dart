import 'package:barcode_scanner/modules/code_scanner/domain/entities/scanned_code.dart';
import 'package:barcode_scanner/modules/code_scanner/infra/datasources/create_scanned_code_datasource.dart';
import 'package:barcode_scanner/modules/code_scanner/infra/datasources/delete_scanned_code_datasource.dart';
import 'package:barcode_scanner/modules/code_scanner/infra/datasources/fetch_scanned_codes_datasource.dart';
import 'package:barcode_scanner/modules/code_scanner/infra/models/scanned_codes_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatasource
    implements
        FetchScannedCodesDatasource,
        CreateScannedCodeDatasource,
        DeleteScannedCodeDatasource {
  final FirebaseFirestore firestore;

  FirebaseDatasource(this.firestore);

  @override
  Stream<List<ScannedCodeModel>> fetch() {
    final response = firestore.collection('scanned_codes').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => ScannedCodeModel.fromMap(doc.data(), doc.id))
            .toList());

    return response;
  }

  @override
  Future create(ScannedCode scannedCode) async {
    final doc = firestore.collection('scanned_codes').doc();

    final json = {
      'code': scannedCode.code,
      'timestamp': scannedCode.timestamp,
    };

    await doc.set(json);
  }

  @override
  Future delete(String id) async {
    final doc = firestore.collection('scanned_codes').doc(id);

    doc.delete();
  }
}
