import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'drawer_scree.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: Container(
        child: context.watch<ChangePage>().currentScreen,
      ),
    );
  }
}
