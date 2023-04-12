import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'login/login_screen.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static String id = 'register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confPassController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    confPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 219, 200),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(
          child: Text('Register'),
        ),
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
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(80.0),
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return ('Please set your password');
                  } else if (value != confPassController.text) {
                    return ('Both password should be the same!');
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: confPassController,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  prefix: Icon(Icons.password),
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(80.0))),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return ('This field is required!');
                  } else if (value != passController.text) {
                    return ('Both password should be the same!');
                  }
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print(
                        '${userController.text}-${passController.text}-${confPassController.text}');

                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: userController.text,
                              password: passController.text);
                      if (kDebugMode) {
                        print(newUser.user!.displayName);
                      }
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false);
                    } on FirebaseAuthException catch (e) {
                      if (kDebugMode) {
                        print(e.code);
                      }
                      if (e.code == "email-already-in-use") {
                        if (kDebugMode) {
                          print(
                              'Thrown if there already exists an account with the given email address');
                        }
                      } else if (e.code == "invalid-email") {
                        if (kDebugMode) {
                          print('Thrown if the email address is not valid.');
                        }
                      } else if (e.code == 'operation-not-allowed') {
                        if (kDebugMode) {
                          print(
                              'Thrown if email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.');
                        }
                      } else if (e.code == 'weak-password') {
                        print('weak-password');
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                child: const Text('Register',
                    style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
