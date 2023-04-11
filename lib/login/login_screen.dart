import 'package:cars_sales/components/cars_sales_form_input.dart';
import 'package:cars_sales/components/cars_sales_text_flied.dart';
import 'package:cars_sales/home.dart';
import 'package:cars_sales/screens/forgot_password_screen.dart';
import 'package:cars_sales/screens/register_screen.dart';
import 'package:cars_sales/services/validator_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cars_sales/screens/forgot_password_screen.dart';
import 'package:provider/provider.dart';

import 'login_screen_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset('assets/logo.jpg'),
                  ),
                  Column(
                    children: [
                      CarsSalesInput(
                        label: 'Email',
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (ValidatorService.isEmail(value)) {
                            return 'Insert a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CarsSalesInput(
                        obscureText: true,
                        label: 'Password',
                        controller: password,
                        validator: (value) {
                          if (ValidatorService.isEmpty(value!)) {
                            return 'Password field is required';
                          }
                          return null;
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (kDebugMode) {
                                  print('${email.text}-${password.text}');
                                  context.read<LoginScreenBloc>().add(
                                        Login(
                                          username: email.text,
                                          password: password.text,
                                        ),
                                      );
                                }
                              }
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
