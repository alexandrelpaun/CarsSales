import 'package:cars_sales/home.dart';
import 'package:cars_sales/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardWidget extends StatefulWidget {
  CardWidget(
      {this.id,
      this.index,
      this.titleCars,
      this.descriptionCars,
      this.price,
      required this.imageCars});

  int? id;
  int? index;
  String? titleCars;
  String? descriptionCars;
  String? price;
  Image? imageCars;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late final String likedKey;
  bool liked = false;
  late SharedPreferences prefs;

  void init() {
    super.initState();

    likedKey = widget.id as String;
    _restorePersistPreferences();
  }

  void _restorePersistPreferences() async {
    // Loading likedKey value on start app
    prefs = await SharedPreferences.getInstance();
    liked = prefs.getBool(likedKey) == null ? false : prefs.getBool(likedKey)!;
    setState(() {});
  }

  void _persistPreferences(bool liked) async {
    // loading likedKey value after click favorite button

    prefs = await SharedPreferences.getInstance();
    prefs.setBool(likedKey, liked);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: widget.imageCars,
        title: Text(widget.titleCars!),
        subtitle: Text(widget.descriptionCars ?? ''),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              liked = !liked;
            });

            _persistPreferences(liked);
          },
          icon: Icon(
            liked ? Icons.favorite : Icons.favorite_border,
            color: liked ? Colors.red : Colors.grey,
          ),
        ),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false);
        },
      ),
    );
  }
}
