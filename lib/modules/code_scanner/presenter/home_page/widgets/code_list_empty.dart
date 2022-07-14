import 'package:flutter/material.dart';

Widget codeListEmpty() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Image(
          image: AssetImage('assets/empty.png'),
        ),
        Text(
          'Nenhum código salvo\nTente escanear um novo QR code',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
