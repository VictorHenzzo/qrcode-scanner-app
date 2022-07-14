import 'package:barcode_scanner/modules/code_scanner/domain/repositories/delete_scanned_code_repository.dart';
import 'package:barcode_scanner/modules/code_scanner/infra/datasources/delete_scanned_code_datasource.dart';

class DeleteScannedCodeRepositoryImpl implements DeleteScannedCodeRepository {
  final DeleteScannedCodeDatasource datasource;

  DeleteScannedCodeRepositoryImpl(this.datasource);

  @override
  Future delete(String id) async {
    try {
      final result = await datasource.delete(id);

      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
