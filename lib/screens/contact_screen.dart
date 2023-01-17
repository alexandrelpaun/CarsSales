import 'package:cars_sales/home.dart';
import 'package:cars_sales/models/model_contact.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> sendEmail(ContactModel mesaj) async {
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

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
          'Contact',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                textAlign: TextAlign.center,
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail_outlined),
                  labelText: 'Name',
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
                  labelText: 'Email',
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
                maxLines: 10,
                textAlign: TextAlign.center,
                controller: msgController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail_outlined),
                  labelText: 'Message',
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

                    await sendEmail(mesaj);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
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
