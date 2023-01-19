import 'package:cars_sales/cars/announcements_cars.dart';
import 'package:cars_sales/cars/individual_car.dart';
import 'package:cars_sales/home.dart';
import 'package:cars_sales/screens/contact_screen.dart';
import 'package:cars_sales/screens/drawer_scree.dart';
import 'package:cars_sales/screens/login_screen.dart';
import 'package:cars_sales/screens/main_screen.dart';
import 'package:cars_sales/screens/order_formular.dart';
import 'package:cars_sales/screens/register_screen.dart';
import 'package:cars_sales/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

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
      // initialRoute: SplashScreen.id,
      // routes: {
      //   SplashScreen.id: (context) =>
      //       SplashScreen(), // Am adaugat in clasa SplashScreen variabial statica de tip String id,
      //   Home.id: (context) => Home(),
      //   '/login': (context) => Login(),
      //   '/register': (context) => Register(),
      //   '/forgotPass': (context) => AnnouncementsCars(),
      //   '/contact': (context) => Contact(),
      //   '/orderFormular': (context) => OrderFormular(),
      //   '/individualCar': (context) => IndividualCar(),
      // },
      home: Provider<ChangePage>(
        create: (context) => ChangePage(),
        child: MainScreen(),
      ),
    );
  }
}
