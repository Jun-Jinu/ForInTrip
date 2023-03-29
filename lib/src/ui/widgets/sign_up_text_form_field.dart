import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class SignUpTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;
  final String hintText;
  final String? Function(String?)? validator;

  SignUpTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.validator,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    const double formBorderWidth = 1.0;
    const double formTextSize = 14.0;
    final Color formBorderColor = gray3;

    return TextFormField(
      obscureText: obscureText == true ? true : false,
      controller: controller,
      validator: validator,
      style: const TextStyle(fontSize: formTextSize),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: formBorderColor,
            width: formBorderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: formBorderColor,
            width: formBorderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: formBorderColor,
            width: formBorderWidth,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      cursorColor: Colors.orange,
    );
  }
}
