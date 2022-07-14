import 'package:barcode_scanner/modules/code_scanner/domain/entities/scanned_code.dart';
import 'package:barcode_scanner/modules/code_scanner/presenter/qr_code_scanner_page/qr_code_scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({super.key});

  @override
  State<QRCodeScannerPage> createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  final pageController = Modular.get<QRCodeScannerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escaneie um código'),
      ),
      body: MobileScanner(
          allowDuplicates: false,
          onDetect: (barcode, args) {
            final scannedCode = ScannedCode(
              code: barcode.rawValue!,
              timestamp: DateFormat('dd/MM/yyyy hh:mm')
                  .format(DateTime.now())
                  .toString(),
            );

            pageController.createScannedCodeUseCase.create(scannedCode);
            Modular.to.pop(true);
          }),
    );
  }
}
