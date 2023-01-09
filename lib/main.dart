import 'package:cars_sales/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CarsSales());
}

class CarsSales extends StatelessWidget {
  const CarsSales({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Samsareala.ro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
