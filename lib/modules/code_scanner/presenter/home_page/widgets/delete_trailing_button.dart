import 'package:barcode_scanner/modules/code_scanner/domain/entities/scanned_code.dart';
import 'package:flutter/material.dart';

InkWell deleteTrailingButton(ScannedCode scannedCode, BuildContext context,
    Future Function(String id) deleteFunction) {
  return InkWell(
    onTap: () => showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Deseja remover o item?'),
        content: const Text('Esta ação não poderá ser desfeita'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () {
              deleteFunction(scannedCode.id!);
              Navigator.pop(context);
            },
            child: const Text('Sim'),
          ),
        ],
      ),
    ),
    child: const Icon(
      Icons.delete,
      color: Colors.red,
    ),
  );
}
