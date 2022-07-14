import 'package:barcode_scanner/modules/code_scanner/domain/entities/scanned_code.dart';

abstract class FetchScannedCodesRepository {
  Stream<List<ScannedCode>> fetch();
}
