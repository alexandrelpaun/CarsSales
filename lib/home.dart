import 'dart:ui';
import 'package:cars_sales/models/model_announcement.dart';
import 'package:cars_sales/widgets/app_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cars_sales/screens/contact_screen.dart';
import 'package:cars_sales/screens/login_screen.dart';
import 'package:cars_sales/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'cars/announcements_cars.dart';
import 'screens/register_screen.dart';

class Home extends StatefulWidget {
  static String id = 'home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final _auth = FirebaseAuth.instance;

  static final List<Widget> _pages = <Widget>[
    AnnouncementsCars(),
    Text('Item2'),
  ];

  @override
  Widget build(BuildContext context) {
    var user = _auth.currentUser;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.person, color: Colors.white),
            label: Text(
              '${user?.email}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              _auth.signOut();

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                  (route) => false);
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Cars',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pieces',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
