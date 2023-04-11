import 'package:cars_sales/models/car_model_announcement.dart';
import 'package:cars_sales/widgets/car_card_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class Cars extends StatefulWidget {
  @override
  State<Cars> createState() => _CarsState();

  List<CarAnnouncementModel> announcement = [];

  Cars({super.key, required this.announcement});
}

class _CarsState extends State<Cars> {
  late Future<CarAnnouncementModel> futureAnunt;

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
          padding: const EdgeInsets.all(8.0),
          itemCount: widget.announcement.length,
          itemBuilder: (context, index) {
            if (kDebugMode) {
              print(index);
            }

            return CarCardWidget(
              index: index,
              // categories: widget.announcement[30].categories ?? '',
              id: widget.announcement[index].id,
              priceCars: widget.announcement[index].price,
              titleCars: (widget.announcement[index].name ?? ''),
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
