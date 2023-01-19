import 'package:cars_sales/models/drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/drawer_scree.dart';

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
            icon: Icons.person,
            onTap: () {
              Provider.of<ChangePage>(context, listen: false)
                  .changeTheScreen(ScreenEnum.homeScreen);
            },
          ),
          DrawerTile(
            title: 'Login',
            icon: Icons.person,
            onTap: () {
              Provider.of<ChangePage>(context, listen: false)
                  .changeTheScreen(ScreenEnum.loginScreen);
            },
          ),
          DrawerTile(
            title: 'Contact',
            icon: Icons.person,
            onTap: () {
              Provider.of<ChangePage>(context, listen: false)
                  .changeTheScreen(ScreenEnum.contactScreen);
            },
          ),
        ],
      ),
    );
  }
}
