import 'package:cars_sales/screens/login_screen.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: widget.imageCars,
        title: Text(widget.titleCars!),
        subtitle: Text(widget.descriptionCars ?? ''),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false);
        },
      ),
    );
  }
}
