import 'package:barcode_scanner/modules/code_scanner/domain/repositories/delete_scanned_code_repository.dart';

abstract class DeleteScannedCode {
  Future delete(String id);
}

class DeleteScannedCodesImpl implements DeleteScannedCode {
  final DeleteScannedCodeRepository repository;

  DeleteScannedCodesImpl(this.repository);

  @override
  Future delete(String id) async {
    return await repository.delete(id);
  }
}
