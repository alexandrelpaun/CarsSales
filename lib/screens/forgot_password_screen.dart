import 'package:flutter/material.dart';
import 'package:cars_sales/login/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _userController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void dispose() {
    _userController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 219, 200),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: const Text('Reset Password'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Please insert your e-mail adrress!'),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                controller: _userController,
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
              const SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print('userController.text');

                    try {
                      final newPassword = await _auth.sendPasswordResetEmail(
                        email: _userController.text,
                      );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false);
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                    }
                  }
                },
                child: const Text('Reset your password!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
