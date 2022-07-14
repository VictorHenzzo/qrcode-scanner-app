import 'package:barcode_scanner/modules/code_scanner/infra/models/scanned_codes_model.dart';

abstract class FetchScannedCodesDatasource {
  Stream<List<ScannedCodeModel>> fetch();
}
