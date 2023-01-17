import 'dart:convert';
import 'package:cars_sales/cars.dart';
import 'package:cars_sales/models/model_announcement.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List<AnnouncementModel>> fetchAnnouncementModel() async {
  String user = dotenv.get('username', fallback: '');
  String pass = dotenv.get('password', fallback: '');

  String basicAuth = 'Basic ' + base64.encode(utf8.encode('$user:$pass'));

  final response = await http.get(
      Uri.parse('https://www.samsareala.ro/wp-json/wc/v3/products'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': basicAuth,
      });

  print(response.body);

  return parseAnnouncementModel(response.body);
}

List<AnnouncementModel> parseAnnouncementModel(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return parsed
      .map<AnnouncementModel>((json) => AnnouncementModel.fromJson(json))
      .toList();
}

class AnnouncementsCars extends StatefulWidget {
  const AnnouncementsCars({super.key});

  @override
  State<AnnouncementsCars> createState() => _AnnouncementsCarsState();
}

class _AnnouncementsCarsState extends State<AnnouncementsCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<AnnouncementModel>>(
        future: fetchAnnouncementModel(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Center(
              child: Text(snapshot.error!.toString()),
            );
          } else if (snapshot.hasData) {
            return Cars(announcement: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
