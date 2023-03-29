import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class SignUpTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool? obscureText;
  final String hintText;
  final String? Function(String?)? validator;

  SignUpTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.obscureText,
  }) : super(key: key);

  @override
  _SignUpTextFormFieldState createState() => _SignUpTextFormFieldState();
}

class _SignUpTextFormFieldState extends State<SignUpTextFormField> {
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _showClearButton = widget.controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double formBorderWidth = 1.0;
    const double formTextSize = 14.0;
    final Color formBorderColor = gray3;

    return TextFormField(
      obscureText: widget.obscureText == true ? true : false,
      controller: widget.controller,
      validator: widget.validator,
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
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: gray1,
        ),
        suffixIcon: _showClearButton
            ? IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: gray5,
                ),
                onPressed: () {
                  widget.controller.clear();
                  setState(() {
                    _showClearButton = false;
                  });
                },
              )
            : null,
      ),
      cursorColor: Colors.orange,
    );
  }
}
