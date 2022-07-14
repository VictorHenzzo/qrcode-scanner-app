import 'package:barcode_scanner/modules/code_scanner/domain/entities/scanned_code.dart';
import 'package:barcode_scanner/modules/code_scanner/domain/repositories/create_scanned_code_repository.dart';

abstract class CreateScannedCode {
  Future create(ScannedCode scannedCode);
}

class CreateScannedCodesImpl implements CreateScannedCode {
  final CreateScannedCodeRepository repository;

  CreateScannedCodesImpl(this.repository);

  @override
  Future create(ScannedCode scannedCode) async {
    return await repository.create(scannedCode);
  }
}
