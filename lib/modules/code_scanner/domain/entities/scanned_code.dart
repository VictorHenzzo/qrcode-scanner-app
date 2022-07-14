class ScannedCode {
  final String code;
  final String timestamp;
  final bool? isUrl;
  final String? id;

  ScannedCode({
    required this.code,
    required this.timestamp,
    this.id,
    this.isUrl,
  });
}
