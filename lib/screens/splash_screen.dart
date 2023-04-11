import 'package:cars_sales/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String id = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false);
    });

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(80.0),
            child: Image.asset(
              'assets/logo.jpg',
            ),
          ),
          const Text(
            'Samsareala.ro',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 75, 62, 61),
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
              fontSize: 60,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
