import 'package:barcode_scanner/modules/code_scanner/domain/entities/scanned_code.dart';
import 'package:barcode_scanner/modules/code_scanner/presenter/home_page/home_controller.dart';
import 'package:barcode_scanner/modules/code_scanner/presenter/home_page/widgets/code_list_empty.dart';
import 'package:barcode_scanner/modules/code_scanner/presenter/home_page/widgets/delete_trailing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EAN13 and QR code scanner'),
      ),
      body: Center(
          child: StreamBuilder(
        stream: controller.fetchScannedCodeUseCase(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final codes = snapshot.data!;

            if (codes.isEmpty) {
              return codeListEmpty();
            }

            return ListView(
              padding: const EdgeInsets.only(
                  bottom: kFloatingActionButtonMargin + 70),
              children: codes.map(_buildCode).toList(),
            );
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Ops! Algo deu errado'));
          }

          return const Center(child: CircularProgressIndicator());
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? resultOfScan = await Modular.to.pushNamed('/scanner');
          bool codeWasScannedSucessfuly =
              resultOfScan != null && resultOfScan == true;

          if (codeWasScannedSucessfuly) {
            if (!mounted) return;

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('O código foi escaneado e salvo com sucesso!'),
              backgroundColor: Colors.green,
            ));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCode(ScannedCode scannedCode) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          child: ListTile(
            title: Text(
              scannedCode.code,
              style: scannedCode.isUrl!
                  ? const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    )
                  : const TextStyle(),
            ),
            subtitle: Text('Escaneado em: ${scannedCode.timestamp}'),
            onTap: () async {
              if (scannedCode.isUrl!) {
                final Uri url = Uri.parse(scannedCode.code);

                await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                );
              }
            },
            trailing: deleteTrailingButton(
              scannedCode,
              context,
              controller.deleteScannedCodesUseCase.delete,
            ),
          ),
        ),
      );
}
