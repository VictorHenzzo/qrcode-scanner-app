// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barcode_scanner/modules/code_scanner/domain/usecases/delete_scanned_code.dart';
import 'package:barcode_scanner/modules/code_scanner/domain/usecases/fetch_scanned_codes.dart';

class HomeController {
  HomeController(this.fetchScannedCodeUseCase, this.deleteScannedCodesUseCase);

  final FetchScannedCodesImpl fetchScannedCodeUseCase;
  final DeleteScannedCodesImpl deleteScannedCodesUseCase;
}
