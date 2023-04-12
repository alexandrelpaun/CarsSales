import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String id = 'splash_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF9F9F9),
              Color.fromRGBO(252, 244, 228, 1.0),
              Color(0xFFFFFFFF),
            ],
            stops: [
              0.0,
              0.51,
              1.0,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('assets/logo.png'),
              ),
            ),
            const Expanded(
              flex: 3,
              child: Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(color: Colors.lightBlue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
