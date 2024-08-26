import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/OTP.dart';
import 'home_page.dart';
import 'registration_page.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Import CarouselSlider

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Timer? _logoutTimer;
  bool _isRememberMeChecked = false; // Variable to store checkbox state

  @override
  void initState() {
    super.initState();
    _startLogoutTimer();
  }

  void _startLogoutTimer() {
    _logoutTimer?.cancel(); // Cancel any previous timer
    _logoutTimer = Timer(
        const Duration(minutes: 1), _handleLogout); // Set a 1-minute timer
  }

  void _handleLogout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginPage()), // Navigate back to LoginPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startLogoutTimer, // Reset the timer on user interaction
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Image Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.6,
              ),
              items: [
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwsqPu0o000EtLnvJPKZcTtfgubxj2WeoL_A&s//via.placeholder.com/600x400',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwsqPu0o000EtLnvJPKZcTtfgubxj2WeoL_A&s//via.placeholder.com/600x400',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwsqPu0o000EtLnvJPKZcTtfgubxj2WeoL_A&s//via.placeholder.com/600x400',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Image.network(
                        i,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            // Login Form
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Remember Me Checkbox
                        Row(
                          children: [
                            Checkbox(
                              value: _isRememberMeChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isRememberMeChecked = value ?? false;
                                });
                              },
                            ),
                            const Text('ບັນທຶກເບີ'),
                          ],
                        ),

                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 10,
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OtpPage()),
                            );  // Handle "Forgot Password?" action here
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.blue),
                          ),

                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage()),
                            );
                          },
                          child: const Text.rich(
                            TextSpan(
                              text: "Don't have an account? ",
                              children: [
                                TextSpan(
                                  text: 'Register',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget _buildGridItem(IconData icon, String label, BuildContext context, Widget page) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent, width: 2),
            borderRadius: BorderRadius.circular(8), // Optional: To make the corners rounded
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(icon, size: 40, color: Colors.blueAccent),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16, // Increased font size
            fontWeight: FontWeight.bold, // Optional: To make the font bold
          ),
        ),
      ],
    ),
  );
}
