import 'dart:convert';
import 'package:cars_sales/cars.dart';
import 'package:cars_sales/models/model_announcement.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AnnouncementsCars extends StatefulWidget {
  AnnouncementsCars({super.key});

  @override
  State<AnnouncementsCars> createState() => _AnnouncementsCarsState();
}

class _AnnouncementsCarsState extends State<AnnouncementsCars> {
  bool isLoading = false;
  List<AnnouncementModel> announcements = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                List<AnnouncementModel> apiResult =
                    await fetchAnnouncementModel();

                setState(() {
                  announcements = apiResult;
                });
              },
              child: Cars(
                announcement: announcements,
              ),
            ),
    );
  }

  void init() async {
    setState(() {
      isLoading = true;
    });

    List<AnnouncementModel> apiResult = await fetchAnnouncementModel();

    setState(() {
      isLoading = false;
      announcements = apiResult;
    });
  }

  Future<List<AnnouncementModel>> fetchAnnouncementModel() async {
    String user = dotenv.get('username', fallback: '');
    String pass = dotenv.get('password', fallback: '');

    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$user:$pass'));
    print(basicAuth);

    final response = await http.get(
        Uri.parse('https://www.samsareala.ro/wp-json/wc/v3/products'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization': basicAuth,
        });

    print(response.statusCode);

    return parseAnnouncementModel(response.body);
  }

  List<AnnouncementModel> parseAnnouncementModel(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return parsed
        .map<AnnouncementModel>((json) => AnnouncementModel.fromJson(json))
        .toList();
  }
}
