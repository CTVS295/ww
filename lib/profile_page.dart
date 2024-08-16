import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = "Your Name";
  String _province = "Your Province";
  String _district = "Your District";
  ImageProvider _profileImage = const AssetImage('assets/default_profile.png');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
    _provinceController.text = _province;
    _districtController.text = _district;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _provinceController.dispose();
    _districtController.dispose();
    super.dispose();
  }

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

  void _clearFields() {
    setState(() {
      _nameController.clear();
      _provinceController.clear();
      _districtController.clear();
      _name = "";
      _province = "";
      _district = "";
    });
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all stored preferences

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _clearFields,
            tooltip: 'Clear fields',
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: _profileImage,
              radius: 50,
            ),
            TextButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: const Text('Change Profile Picture'),
            ),
            TextButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: const Text('Take a New Picture'),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _provinceController,
              decoration: const InputDecoration(labelText: 'Province'),
            ),
            TextField(
              controller: _districtController,
              decoration: const InputDecoration(labelText: 'District'),
            ),
          ],
        ),
      ),
    );
  }
}
