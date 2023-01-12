import 'package:cars_sales/models/model_announcement.dart';
import 'package:cars_sales/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class Cars extends StatefulWidget {
  Cars({super.key});

  @override
  State<Cars> createState() => _CarsState();

  List<AnnouncementModel> announcement = [];
}

class _CarsState extends State<Cars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 219, 200),
      drawer: Drawer(
          child: ListView(
        children: [
          Text('Sales Cars'),
          ListTile(
            title: Text('Categories'),
          ),
          ListTile(
            title: Text('Marks'),
          ),
        ],
      )),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          'Sales Cars',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(8.0),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: widget.announcement.length,
          itemBuilder: (context, index) {
            return CardWidget(
              index: index,
              id: widget.announcement[index].id,
              title: widget.announcement[index].name,
              description: widget.announcement[index].description,
              price: widget.announcement[index].price,
              image: widget.announcement[index].image != null
                  ? Image.network(widget.announcement[index].image!)
                  : Image.asset('assets/logo.jog'),
            );
          }),
    );
  }
}
