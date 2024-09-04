import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kvp/screen/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // Transparent status bar
    ));
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(25, 72, 106, 1.0),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/seva-logo-remove.png'),
            ),
          ),
        ),
      ),
    );
  }
}
