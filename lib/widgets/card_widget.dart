import 'package:cars_sales/screens/login_screen.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget(
      {this.id,
      this.index,
      required this.title,
      required this.description,
      this.price,
      required this.image});

  int? id;
  int? index;
  String? title;
  String? description;
  String? price;
  Image? image;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: widget.image,
        title: Text('${widget.price} - ' ' - ${widget.title ?? ''}'),
        subtitle: Text(widget.description ?? ''),
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
