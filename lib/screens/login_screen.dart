import 'package:cars_sales/home.dart';
import 'package:cars_sales/screens/forgot_password_screen.dart';
import 'package:cars_sales/screens/register_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cars_sales/screens/forgot_password_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 219, 200),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                textAlign: TextAlign.center,
                controller: userController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail_outlined),
                  labelText: 'User@email.com',
                  hintText: 'User',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                  ),
                ),
                validator: (value) {
                  if (value != null && !EmailValidator.validate(value)) {
                    return ('Please insert a valid email adrress');
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                textAlign: TextAlign.center,
                controller: passController,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: const InputDecoration(
                  prefix: Icon(Icons.password),
                  labelText: 'Password',
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(80.0),
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return ('Please enter your password');
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print('${userController.text}-${passController.text}');

                    try {
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: userController.text,
                          password: passController.text);

                      print(newUser.user!.email);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                          (route) => false);
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                      if (e.code == "invalid-email") {
                        print('Thrown if the email address is not valid.');
                      } else if (e.code == "user-disabled") {
                        print(
                            'Thrown if the user corresponding to the given email has been disabled');
                      } else if (e.code == 'wrong-password') {
                        print(
                            'Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set');
                      } else if (e.code == 'user-not-found') {
                        print(
                            'Thrown if there is no user corresponding to the given email');
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                child: Text(
                  'Login',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()),
                        (route) => false),
                    child: Text('Do you forgot your password?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 143, 141, 141))),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                        (route) => false),
                    child: Text('New user!',
                        style: TextStyle(
                            color: Color.fromARGB(255, 143, 141, 141))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
