import 'package:flutter/material.dart';

class AdPage extends StatelessWidget {
  final String url;

  AdPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Advertisement'),
      ),
      body: Center(
        child: Image.network(
          url,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
