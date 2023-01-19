import 'package:cars_sales/models/model_announcement.dart';
import 'package:cars_sales/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class Cars extends StatefulWidget {
  @override
  State<Cars> createState() => _CarsState();

  List<AnnouncementModel> announcement = [];

  Cars({required this.announcement});
}

class _CarsState extends State<Cars> {
  late Future<AnnouncementModel> futureAnunt;

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
          itemCount: widget.announcement.length,
          itemBuilder: (context, index) {
            print(index);

            return CardWidget(
              index: index,
              id: widget.announcement[index].id,
              titleCars: widget.announcement[index].name ?? '',
              descriptionCars: _parseHtmlString(
                  widget.announcement[index].description ?? ''),
              imageCars: widget.announcement[index].imageUrl != null
                  ? Image.network(
                      widget.announcement[index].imageUrl!,
                    )
                  : Image.asset('assets/logo.jpg'),
            );
          }),
    );
  }
}
