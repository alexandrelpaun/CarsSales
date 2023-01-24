import 'package:cars_sales/models/car_model_announcement.dart';
import 'package:cars_sales/widgets/car_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import '../models/part_model_announcement.dart';
import '../widgets/part_card_widget.dart';

class Part extends StatefulWidget {
  @override
  State<Part> createState() => _CarsState();

  List<PartAnnouncementModel> announcementPart = [];

  Part({required this.announcementPart});
}

class _CarsState extends State<Part> {
  late Future<PartAnnouncementModel> futureAnunt;

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: widget.announcementPart.length,
          itemBuilder: (context, index) {
            print(index);

            return PartCardWidget(
              index: index,
              // categories: widget.announcement[30].categories ?? '',
              id: widget.announcementPart[index].id,
              pricePart: widget.announcementPart[index].price,
              titlePart: (widget.announcementPart[index].name ?? ''),
              descriptionPart: _parseHtmlString(
                  widget.announcementPart[index].description ?? ''),
              imagePart: widget.announcementPart[index].imageUrl != null
                  ? Image.network(
                      widget.announcementPart[index].imageUrl!,
                    )
                  : Image.asset('assets/logo.jpg'),
            );
          }),
    );
  }
}
