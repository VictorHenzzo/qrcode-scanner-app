import 'package:barcode_scanner/modules/code_scanner/domain/entities/scanned_code.dart';

abstract class CreateScannedCodeDatasource {
  Future create(ScannedCode scannedCode);
}
