import 'package:cars_sales/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
            builder: (context) => Home(),
          ),
          (route) => false);
    });

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(80.0),
            child: Image.asset(
              'assets/logo.jpg',
            ),
          ),
          Text(
            'Samsareala.ro',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.w300,
              wordSpacing: 6,
              fontSize: 40,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
