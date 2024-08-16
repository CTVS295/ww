import 'package:flutter/material.dart';
import 'package:flutter_application_1/Con_OTP.dart';

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
        backgroundColor: Color.fromARGB(255, 14, 48, 126),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjJ_m8HT6Nzvvcc2rKb6w-sPnWY4biyACdgg&s', // Replace with your logo URL
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              'ETL',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'ເບີໂທລະສັບລວມຂັ້ນ',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Color.fromARGB(255, 14, 48, 126), // สีของข้อความ
                minimumSize: Size(double.infinity, 50), // ปุ่มเต็มความกว้าง
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
                  : null, // เปิดใช้งานเมื่อ Checkbox ถูกติ๊ก
              child: Text('ສົ່ງລະຫັດ OTP'),
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
