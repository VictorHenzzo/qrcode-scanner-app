import 'package:barcode_scanner/modules/code_scanner/domain/entities/scanned_code.dart';
import 'package:barcode_scanner/modules/code_scanner/domain/repositories/create_scanned_code_repository.dart';
import 'package:barcode_scanner/modules/code_scanner/domain/usecases/create_scanned_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_scanned_code_test.mocks.dart';

@GenerateMocks([CreateScannedCodeRepository])
void main() {
  final repository = MockCreateScannedCodeRepository();
  final usecase = CreateScannedCodesImpl(repository);

  test('should return a Future', () async {
    when(repository.create(any)).thenAnswer((_) async => null);
    final result =
        await usecase.create(ScannedCode(code: 'code', timestamp: 'test'));

    expect(result, isA<Future>());
  });
}
