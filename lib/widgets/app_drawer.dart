import 'package:cars_sales/models/drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home.dart';
import '../screens/contact_screen.dart';
import '../screens/login_screen.dart';

// am creat un widget Drawer pe care sa in care folosesc modelul de drawer_model
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
                  ' samsareala.ro',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            title: 'Login',
            icon: Icons.person,
            onTap: () {
              Navigator.pushNamed(context, Login.id);
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
