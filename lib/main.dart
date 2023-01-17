import 'package:cars_sales/cars.dart';
import 'package:cars_sales/announcements_cars.dart';
import 'package:cars_sales/home.dart';
import 'package:cars_sales/screens/contact_screen.dart';
import 'package:cars_sales/screens/login_screen.dart';
import 'package:cars_sales/screens/register_screen.dart';
import 'package:cars_sales/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");

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
      home: Home(),
    );
  }
}
