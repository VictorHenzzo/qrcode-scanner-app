import 'package:barcode_scanner/modules/code_scanner/data/datasources/firebase_datasource.dart';
import 'package:barcode_scanner/modules/code_scanner/domain/usecases/create_scanned_code.dart';
import 'package:barcode_scanner/modules/code_scanner/domain/usecases/delete_scanned_code.dart';
import 'package:barcode_scanner/modules/code_scanner/domain/usecases/fetch_scanned_codes.dart';
import 'package:barcode_scanner/modules/code_scanner/infra/repositories/create_scanned_code_repository_impl.dart';
import 'package:barcode_scanner/modules/code_scanner/infra/repositories/delete_scanned_code_repository_impl.dart';
import 'package:barcode_scanner/modules/code_scanner/infra/repositories/fetch_scanned_codes_repository_impl.dart';
import 'package:barcode_scanner/modules/code_scanner/presenter/home_page/home_controller.dart';
import 'package:barcode_scanner/modules/code_scanner/presenter/home_page/home_page.dart';
import 'package:barcode_scanner/modules/code_scanner/presenter/qr_code_scanner_page/qr_code_scanner_controller.dart';
import 'package:barcode_scanner/modules/code_scanner/presenter/qr_code_scanner_page/qr_code_scanner_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => FetchScannedCodesRepositoryImpl(i())),
        Bind((i) => FetchScannedCodesImpl(i())),
        Bind((i) => CreateScannedCodesImpl(i())),
        Bind((i) => CreateScannedCodeRepositoryImpl(i())),
        Bind((i) => DeleteScannedCodesImpl(i())),
        Bind((i) => DeleteScannedCodeRepositoryImpl(i())),
        Bind((i) => FirebaseFirestore.instance),
        Bind((i) => FirebaseDatasource(i())),
        Bind((i) => HomeController(i(), i())),
        Bind((i) => QRCodeScannerController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/scanner',
            child: (context, args) => const QRCodeScannerPage()),
      ];
}
