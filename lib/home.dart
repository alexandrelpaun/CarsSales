import 'dart:ui';
import 'package:cars_sales/announcements_cars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cars_sales/screens/contact_screen.dart';
import 'package:cars_sales/screens/login_screen.dart';
import 'package:cars_sales/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'screens/register_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  get newUser => null;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final newUser = await _auth.currentUser;
    try {
      if (newUser != null) {
        loggedInUser = newUser;
      }
    } catch (e) {
      print(e);
    }
  }

  static final List<Widget> _pages = <Widget>[
    AnnouncementsCars(),
    Text('Item2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 219, 200),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Text(
              'samsareala.ro',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
                fontSize: 20,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Login'),
              onTap: (() {}),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contact us'),
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Contact(),
                  ),
                );
              }),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.person, color: Colors.white),
            label: Text('', style: TextStyle(color: Colors.white)),
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
