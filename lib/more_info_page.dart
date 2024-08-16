import 'package:flutter/material.dart';

class MoreInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Info Page'),
      ),
      body: const Center(
        child: Text('More Info Content'),
      ),
    );
  }
}
