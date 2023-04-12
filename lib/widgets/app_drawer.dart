import 'package:cars_sales/models/drawer_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home.dart';
import '../screens/contact_screen.dart';

// am creat un widget Drawer pe care sa in care folosesc modelul de drawer_model
class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var user = _auth.currentUser;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                color: Colors.blue[200],
              ),
              child: Center(
                child: Text(
                  '${user?.email}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          DrawerTile(
            title: 'Home',
            icon: Icons.home,
            onTap: () {
              Navigator.pushNamed(context, Home.id);
            },
          ),
          DrawerTile(
            title: 'Contact',
            icon: Icons.contact_mail,
            onTap: () {
              Navigator.pushNamed(context, Contact.id);
            },
          ),
        ],
      ),
    );
  }
}
