import 'package:flutter/material.dart';

class CarsTextFormFields extends TextFormField {
  CarsTextFormFields({
    super.key,
    TextEditingController? controller,
    String? Function(String?)? validator,
    InputDecoration? decoration,
    bool obscureText = false,
  }) : super(
          obscureText: obscureText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF110D4F),
            fontFamily: 'Poppins',
            fontSize: 20,
            // height: 1.8,
            letterSpacing: 0,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Colors.orangeAccent, width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Colors.orangeAccent, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Colors.orangeAccent, width: 2),
            ),
          ),
          validator: validator,
          controller: controller,
        );
}
