import 'package:barcode_scanner/modules/code_scanner/domain/entities/scanned_code.dart';
import 'package:barcode_scanner/modules/code_scanner/domain/repositories/fetch_scanned_codes_repository.dart';

abstract class FetchScannedCodes {
  Stream<List<ScannedCode>> call();
}

class FetchScannedCodesImpl implements FetchScannedCodes {
  final FetchScannedCodesRepository repository;

  FetchScannedCodesImpl(this.repository);

  @override
  Stream<List<ScannedCode>> call() {
    return repository.fetch();
  }
}
