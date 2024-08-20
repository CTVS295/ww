import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ການແຈ້ງເຕືອນ',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 54, 158, 244),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.insert_drive_file,
              size: 100,
              color: Colors.grey[400],
            ),
            SizedBox(height: 20),
            Text(
              'ບໍ່ມີການແຈ້ງເຕືອນ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'ບໍ່ທັນມີການແຈ້ງເຕືອນບໍລິການ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
