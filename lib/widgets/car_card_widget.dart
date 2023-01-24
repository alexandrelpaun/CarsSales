import 'package:cars_sales/home.dart';
import 'package:cars_sales/screens/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../cars/individual_car.dart';

class CarCardWidget extends StatefulWidget {
  CarCardWidget(
      {this.categories,
      this.id,
      this.index,
      this.titleCars,
      this.priceCars,
      this.descriptionCars,
      required this.imageCars});

  int? id;
  int? index;
  String? titleCars;
  String? descriptionCars;
  String? priceCars;
  String? categories;

  Image? imageCars;

  @override
  State<CarCardWidget> createState() => _CarCardWidgetState();
}

class _CarCardWidgetState extends State<CarCardWidget> {
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
    return GestureDetector(
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: widget.imageCars,
          title: Text(
            widget.priceCars ?? '',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(widget.titleCars ?? ''),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IndividualCar(
                  imageCars: widget.imageCars,
                  titleCars: widget.titleCars,
                  descriptionCars: widget.descriptionCars,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
