import 'package:cars_sales/cars/individual_car.dart';
import 'package:cars_sales/home.dart';
import 'package:cars_sales/login/login_screen_bloc.dart';
import 'package:cars_sales/screens/contact_screen.dart';
import 'package:cars_sales/screens/forgot_password_screen.dart';
import 'package:cars_sales/login/login_screen.dart';
import 'package:cars_sales/screens/order_formular.dart';
import 'package:cars_sales/screens/register_screen.dart';
import 'package:cars_sales/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const CarsSales());
}

class CarsSales extends StatelessWidget {
  const CarsSales({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginScreenBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Samsareala.ro',
        initialRoute: '/login',
        routes: {
          '/splash_screen': (context) => const SplashScreen(),
          '/home': (context) => const Home(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const Register(),
          '/forgotPass': (context) => const ForgotPassword(),
          '/contact': (context) => const Contact(),
          '/order_formular': (context) => const OrderFormular(),
          '/individualCar': (context) => IndividualCar(),
        },
      ),
    );
  }
}
