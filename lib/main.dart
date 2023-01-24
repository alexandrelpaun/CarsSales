import 'package:cars_sales/cars/announcements_cars.dart';
import 'package:cars_sales/cars/individual_car.dart';
import 'package:cars_sales/home.dart';
import 'package:cars_sales/screens/contact_screen.dart';
import 'package:cars_sales/screens/login_screen.dart';
import 'package:cars_sales/screens/order_formular.dart';
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
        initialRoute: Home.id,
        routes: {
          SplashScreen.id: (context) =>
              const SplashScreen(), // Am adaugat in clasa SplashScreen variabial statica de tip String id,
          Home.id: (context) => const Home(),
          Login.id: (context) => const Login(),
          '/register': (context) => Register(),
          '/forgotPass': (context) => AnnouncementsCars(),
          Contact.id: (context) => const Contact(),
          '/orderFormular': (context) => OrderFormular(),
          '/individualCar': (context) => IndividualCar(),
        });
  }
}
