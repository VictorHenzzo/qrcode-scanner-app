import 'package:barcode_scanner/modules/code_scanner/domain/entities/scanned_code.dart';
import 'package:barcode_scanner/modules/code_scanner/domain/repositories/create_scanned_code_repository.dart';
import 'package:barcode_scanner/modules/code_scanner/infra/datasources/create_scanned_code_datasource.dart';

class CreateScannedCodeRepositoryImpl implements CreateScannedCodeRepository {
  final CreateScannedCodeDatasource datasource;

  CreateScannedCodeRepositoryImpl(this.datasource);

  @override
  Future create(ScannedCode scannedCode) async {
    try {
      final result = await datasource.create(scannedCode);

      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
