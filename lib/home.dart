import 'dart:ui';
import 'package:cars_sales/screens/login_screen.dart';
import 'package:cars_sales/screens/register_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    Text('Item1'),
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
              onTap: (() {}),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'samsareala.ro',
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                  (route) => false);
            },
            icon: Icon(
              Icons.person,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone,
            ),
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
            icon: Icon(Icons.battery_charging_full),
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
