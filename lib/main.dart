import 'package:cars_sales/screens/login_screen.dart';
import 'package:cars_sales/screens/register_screen.dart';
import 'package:cars_sales/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
