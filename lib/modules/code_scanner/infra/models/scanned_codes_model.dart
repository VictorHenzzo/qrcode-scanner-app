import 'package:barcode_scanner/modules/code_scanner/domain/entities/scanned_code.dart';

class ScannedCodeModel extends ScannedCode {
  ScannedCodeModel({
    required super.code,
    required super.timestamp,
    super.id,
    super.isUrl,
  });

  static ScannedCodeModel fromMap(Map<String, dynamic> map, String id) {
    return ScannedCodeModel(
      code: map['code'],
      timestamp: map['timestamp'],
      isUrl: Uri.parse(map['code']).isAbsolute,
      id: id,
    );
  }
}
