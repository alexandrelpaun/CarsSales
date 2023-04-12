import 'package:flutter/material.dart';
import 'cars/individual_car.dart';
import 'home.dart';
import 'screens/contact_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/order_formular.dart';
import 'screens/register_screen.dart';
import 'screens/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/splash_screen': (context) => const SplashScreen(),
  '/home': (context) => const Home(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const Register(),
  '/forgotPass': (context) => const ForgotPassword(),
  '/contact': (context) => const Contact(),
  '/order_formular': (context) => const OrderFormular(),
  '/individualCar': (context) => IndividualCar(),
};
