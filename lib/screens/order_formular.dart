import 'package:cars_sales/models/model_contact.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../cars/announcements_cars.dart';

Future<http.Response> sendEmailOrder(ContactModel mesaj) async {
  final response = await http.post(
      Uri.parse('https://api.sendgrid.com/v3/mail/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        //TODO Add key to gitignore

        // 'Authorization': 'Bearer $Keys.SENDGRID_API_KEY'
      },
      body:
          '{"personalizations": [{"to": [{"email": "${mesaj.email}"}]}],"from": {"name": "${mesaj.name}"},"subject": "Sending with SendGrid is Fun","content": [{"type": "text/plain", "value": "and easy to do anywhere, even with cURL"}]}');

  print(response.body);

  return (response);
}

class OrderFormular extends StatefulWidget {
  const OrderFormular({super.key});

  @override
  State<OrderFormular> createState() => _OrderFormularState();
}

class _OrderFormularState extends State<OrderFormular> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController msgController = TextEditingController();
  Future<ContactModel>? _futureContactModel;

  void dispose() {
    userController.dispose();
    nameController.dispose();
    msgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 219, 200),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          'Order Formular',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                textAlign: TextAlign.center,
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail_outlined),
                  hintText: 'Name',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ('Please insert your name!');
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                textAlign: TextAlign.center,
                controller: userController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail_outlined),
                  hintText: 'Email',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                ),
                validator: (value) {
                  if (value != null && !EmailValidator.validate(value)) {
                    return ('Please insert your e-mail address!');
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                minLines: 4,
                maxLines: 6,
                textAlign: TextAlign.center,
                controller: msgController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail_outlined),
                  hintText: 'Message',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ('Please insert your message!');
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print(
                        '${userController.text}-${nameController.text}-${msgController.text}');

                    ContactModel mesaj = new ContactModel(
                        email: userController.text,
                        msg: msgController.text,
                        name: nameController.text);

                    await sendEmailOrder(mesaj);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnnouncementsCars()),
                        (route) => false);
                  }
                  return null;
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
