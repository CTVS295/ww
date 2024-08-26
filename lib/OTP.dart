import 'package:flutter/material.dart';
import 'login_page.dart';
import 'Con_OTP.dart';

void main() {
  runApp(Otp());
}

class Otp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OtpPage(),
    );
  }
}

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool _agreeToTerms = false;
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OTP',
          style: TextStyle(
            fontSize: 28,
           color: Colors.black, // Corrected color property
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwsqPu0o000EtLnvJPKZcTtfgubxj2WeoL_A&s', // Replace with your logo URL
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'ETL',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'ເບີໂທລະສັບຂອງທ່ານ',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'ຂ້ອຍຍອມຮັບເງື່ອນໄຂ ແລະ ຂໍ້ກໍານົດ',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: _agreeToTerms
                  ? () {
                      _sendOtp();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(),
                        ),
                      );
                    }
                  : null,
              child: const Text('ສົ່ງລະຫັດ OTP'),
            ),
          ],
        ),
      ),
    );
  }

  void _sendOtp() {
    // Implement OTP sending logic here
    print('Phone number: ${_phoneController.text}');
  }
}
