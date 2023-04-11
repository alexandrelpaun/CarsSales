import 'package:cars_sales/home.dart';
import 'package:cars_sales/login/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../cars/individual_car.dart';
import '../parts/individual_part.dart';

class PartCardWidget extends StatefulWidget {
  PartCardWidget(
      {super.key,
      this.id,
      this.index,
      this.titlePart,
      this.pricePart,
      this.descriptionPart,
      required this.imagePart});

  int? id;
  int? index;
  String? titlePart;
  String? descriptionPart;
  String? pricePart;
  Image? imagePart;

  @override
  State<PartCardWidget> createState() => _PartCardWidgetState();
}

class _PartCardWidgetState extends State<PartCardWidget> {
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
          leading: widget.imagePart,
          title: Text(widget.titlePart ?? ''),
          subtitle: Text(
            '${widget.pricePart} ${'EUR'}',
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                builder: (context) => IndividualPart(
                  imagePart: widget.imagePart,
                  titlePart: widget.titlePart,
                  descriptionPart: widget.descriptionPart,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
