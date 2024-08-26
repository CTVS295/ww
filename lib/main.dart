import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogoScreen(),
    );
  }
}

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _visible = true;
      });
      // Delay before navigating to the new page
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(        
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Uncle_Sam_%28pointing_finger%29.png/571px-Uncle_Sam_%28pointing_finger%29.png",
                height: 120,
              ), 
              SizedBox(height: 20),
              Text(
                "FTB",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
