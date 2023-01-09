import 'dart:ui';
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
                letterSpacing: 2,
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
        title: Text(
          'samsareala.ro',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w500,
            letterSpacing: 4,
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
