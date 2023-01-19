import 'package:cars_sales/screens/order_formular.dart';
import 'package:flutter/material.dart';

class IndividualCar extends StatelessWidget {
  IndividualCar(
      {super.key,
      this.id,
      this.imageCars,
      this.titleCars,
      this.descriptionCars});

  Image? imageCars;
  String? titleCars;
  String? descriptionCars;
  int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleCars ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            imageCars!,
            Text(titleCars ?? ''),
            Text(descriptionCars ?? ''),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderFormular()));
                },
                child: const Text(
                  'ORDER',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  buildTitle(BuildContext context) {}

  buildDescription(BuildContext context) {}
}
