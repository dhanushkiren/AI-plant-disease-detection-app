import 'dart:async';
import 'package:flutter/material.dart';
import '../predict.dart';  // Import the main application page

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Duration to wait before navigating to the main page
    Timer(Duration(seconds: 3), () {
      // Navigate to the main page after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PredictPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set a background color or image
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your splash logo or design
            Image.asset(
              'assets/logo.png', // Replace with your own logo or image
              height: 400,
              width: 400,
            ),
            // const SizedBox(height: 30),
            // const Text(
            //   'Plant Disease Detection',
            //   style: TextStyle(
            //     fontSize: 25,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
