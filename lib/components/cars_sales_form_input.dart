import 'package:flutter/material.dart';

import 'cars_sales_text_flied.dart';

// ignore: must_be_immutable
class CarsSalesInput extends StatelessWidget {
  TextEditingController? controller;
  String? Function(String?)? validator;
  String? label;
  bool? obscureText;

  CarsSalesInput(
      {super.key,
      this.controller,
      this.validator,
      this.label,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          Text(
            label!,
            style: const TextStyle(
              color: Color(0xFF110D4F),
              fontSize: 14.0,
              height: 20.0 / 14.0, // line height calculation
              fontFamily: 'Poppins',
              letterSpacing: 0.0,
            ),
            textAlign: TextAlign.center,
          ),
        if (label != null)
          const SizedBox(
            height: 15,
          ),
        CarsTextFormFields(
          obscureText: obscureText!,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            fillColor: const Color(0xFFFFFFFF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
