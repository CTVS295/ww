import 'package:flutter/material.dart';
import 'package:flutter_application_1/OTP.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  ImageProvider _profileImage = const AssetImage('assets/default_profile.png');
  bool _isOtpSent = false;
  bool _isOtpVerified = false;
  int _attemptCount = 0;
  final int _maxAttempts = 3;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: source);

      if (image != null) {
        setState(() {
          _profileImage = FileImage(File(image.path));
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  void _sendOtp() {
    if (_mobileNumberController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter your mobile number.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    setState(() {
      _isOtpSent = true;
    });
    Fluttertoast.showToast(
      msg: "OTP sent to your mobile number.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    // Navigate to OTP screen after sending OTP
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpPage(), // Ensure this screen is implemented.
      ),
    );
  }

  void _verifyOtp() {
    if (_otpController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter the OTP.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    setState(() {
      _isOtpVerified = true;
    });
    Fluttertoast.showToast(
      msg: "OTP verified successfully.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _register() async {
    if (_attemptCount >= _maxAttempts) {
      Fluttertoast.showToast(
        msg: "Registration attempts exceeded. Please try again later.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    if (!_isOtpVerified) {
      Fluttertoast.showToast(
        msg: "Please verify OTP first.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    // Perform registration logic here.
    Fluttertoast.showToast(
      msg: "Registration successful!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    // Optionally increment attempt count after a successful registration.
    setState(() {
      _attemptCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.camera_alt),
                          title: const Text('Take a photo'),
                          onTap: () {
                            Navigator.pop(context);
                            _pickImage(ImageSource.camera);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.image),
                          title: const Text('Choose from gallery'),
                          onTap: () {
                            Navigator.pop(context);
                            _pickImage(ImageSource.gallery);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _profileImage,
                child: _profileImage ==
                        const AssetImage('assets/default_profile.png')
                    ? Icon(Icons.camera_alt, size: 50, color: Colors.grey[800])
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              controller: _mobileNumberController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              controller: _nameController,
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Province',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
              controller: _provinceController,
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: 'District',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
              controller: _districtController,
            ),
            const SizedBox(height: 20),
            if (_isOtpSent && !_isOtpVerified) ...[
           
           
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isOtpSent ? _register : _sendOtp,
              child: Text(_isOtpSent ? 'Register' : 'Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
