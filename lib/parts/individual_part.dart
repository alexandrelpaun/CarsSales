import 'package:cars_sales/screens/order_formular.dart';
import 'package:flutter/material.dart';

class IndividualPart extends StatelessWidget {
  IndividualPart(
      {super.key,
      this.id,
      this.imagePart,
      this.titlePart,
      this.descriptionPart,
      this.pricePart});

  Image? imagePart;
  String? titlePart;
  String? descriptionPart;
  int? id;
  String? pricePart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlePart ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            imagePart!,
            Text(pricePart ?? ''),
            Text(titlePart ?? ''),
            Text(descriptionPart ?? ''),
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
