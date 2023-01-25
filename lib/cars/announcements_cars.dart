import 'dart:convert';
import 'package:cars_sales/models/car_model_announcement.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'cars.dart';

// 1. Am convertit Stateless in StateFull ca sa pot schimba starea widgetului cu setState
class AnnouncementsCars extends StatefulWidget {
  const AnnouncementsCars({super.key});

  @override
  State<AnnouncementsCars> createState() => _AnnouncementsCarsState();
}

class _AnnouncementsCarsState extends State<AnnouncementsCars> {
  // 2. isLoading are ca scop sa marcheze ca aplicatia este in loading la primul request (atunci cand se incarca)
  bool isLoading = false;
  // 3. O lista de anunturi pentru a fi trimisa catre clasa Card
  List<CarAnnouncementModel> announcements = [];

  @override
  void initState() {
    // 4. Init() face incarcarea initiala a datelor
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 8. Daca isLoading este true -> afiseaza CircularProgressIndicator
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          // 9. Daca isLoading este false, atunci afiseaza Cars(anunturi)
          // 10. RefreshIndicator contine WidgetulCard
          : RefreshIndicator(
              // 11. Cand lista a fost trasa in jos, faceam un call nou API si incarcam raspunsul intr-o variabila locala apiResult
              // 12. in tot timpul apelului API, loader-ul de la Refreshindicator va fi afisat
              onRefresh: () async {
                List<CarAnnouncementModel> apiResult =
                    await fetchCarAnnouncementModel();
                // 13. Dupa finalizarea call API, incarcam noul raspuns API in lista proprietatea a clasei noastre
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
    // 5. Marcam isLoading = true, si updatam starea aplicatiei, ca sa fie afisat CircularProgressIndicator()
    setState(() {
      isLoading = true;
    });

    // 6. Intr-o variabila numita apiResult stocam raspunsul din API
    List<CarAnnouncementModel> apiResult = await fetchCarAnnouncementModel();

    // 7. Dupa ce s-a terminat request-ul catre api marcam isLoading ca fiind false si incarcam datele in proprietatea clasei 'announcement'
    setState(() {
      isLoading = false;
      announcements = apiResult;
    });
  }

  Future<List<CarAnnouncementModel>> fetchCarAnnouncementModel() async {
    String user = dotenv.get('username', fallback: '');
    String pass = dotenv.get('password', fallback: '');

    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$user:$pass'));
    print(basicAuth);

    final queryParameters = {
      'category': '30',
    };
    final uri = Uri.https(
        'www.samsareala.ro', '/wp-json/wc/v3/products', queryParameters);

    final response = await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json',
      'authorization': basicAuth,
    });

    print(response.statusCode);

    return parseCarAnnouncementModel(response.body);
  }

  List<CarAnnouncementModel> parseCarAnnouncementModel(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return parsed
        .map<CarAnnouncementModel>(
            (json) => CarAnnouncementModel.fromJson(json))
        .toList();
  }
}
