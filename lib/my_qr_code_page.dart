import 'package:flutter/material.dart';

class MyQRCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My QR Code Page'),
      ),
      body: const Center(
        child: Text('My QR Code Content'),
      ),
    );
  }
}
