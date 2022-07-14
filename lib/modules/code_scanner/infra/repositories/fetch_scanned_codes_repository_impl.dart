import 'package:barcode_scanner/modules/code_scanner/domain/entities/scanned_code.dart';
import 'package:barcode_scanner/modules/code_scanner/domain/repositories/fetch_scanned_codes_repository.dart';
import 'package:barcode_scanner/modules/code_scanner/infra/datasources/fetch_scanned_codes_datasource.dart';

class FetchScannedCodesRepositoryImpl implements FetchScannedCodesRepository {
  final FetchScannedCodesDatasource datasource;

  FetchScannedCodesRepositoryImpl(this.datasource);

  @override
  Stream<List<ScannedCode>> fetch() {
    try {
      final result = datasource.fetch();

      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
