import 'package:cars_sales/screens/contact_screen.dart';
import 'package:cars_sales/screens/login_screen.dart';
import 'package:cars_sales/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import '../home.dart';

// am creat clasa Change
enum ScreenEnum { loginScreen, contactScreen, homeScreen }

class ChangePage extends ChangeNotifier {
  late Widget currentScreen = SplashScreen();

  void changeTheScreen(ScreenEnum screen) {
    switch (screen) {
      case ScreenEnum.loginScreen:
        currentScreen = Login();
        break;
      case ScreenEnum.contactScreen:
        currentScreen = Contact();
        break;
      default:
        ScreenEnum.homeScreen;
        currentScreen = Home();
        break;
    }
    notifyListeners();
  }
}
