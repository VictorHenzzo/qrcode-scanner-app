import 'package:barcode_scanner/modules/code_scanner/domain/usecases/create_scanned_code.dart';

class QRCodeScannerController {
  QRCodeScannerController(this.createScannedCodeUseCase);

  final CreateScannedCodesImpl createScannedCodeUseCase;
}
