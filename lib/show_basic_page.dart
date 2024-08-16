import 'package:flutter/material.dart';

class ShowBasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Basic Page'),
      ),
      body: const Center(
        child: Text('Show Basic Content'),
      ),
    );
  }
}
