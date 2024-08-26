import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/OTP.dart';
import 'package:flutter_application_1/home_page.dart';

void main() {
  runApp(MaterialApp(
    home: OtpScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _remainingSeconds = 48;
  Timer? _timer;

  List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtpPage()),
            );
          },
        ),
        title: const Text(
          'ການຢືນຢັນ OTP',
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwsqPu0o000EtLnvJPKZcTtfgubxj2WeoL_A&s",
              height: 50,
            ),
            const SizedBox(height: 20),
            const Text(
              'ກະລຸນາໃສ່ລະຫັດ 4 ໂຕເລກ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return Container(
                  width: 60,
                  child: TextFormField(
                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Text(
              'ສົ່ງອີກ ($_remainingSeconds) ວິນາທີ',
              style: const TextStyle(color: Colors.red, fontSize: 18),
            ),
            TextButton(
              onPressed: () {
                // Add your resend OTP logic here
              },
              child: const Text(
                'ບໍ່ໄດ້ຮັບລະຫັດບໍ?',
                style: TextStyle(color: Colors.green),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to HomePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'ຢືນຢັນ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
