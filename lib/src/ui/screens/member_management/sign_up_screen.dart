import 'package:flutter/material.dart';
import '../../widgets/sign_up_text_form_field.dart';
import '../../widgets/appbar/menu_appbar.dart';
import '../../theme/app_color.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final _nicknameController = TextEditingController();
  String? _selectedGender;

  final List<String> _genders = [
    'Male',
    'Female',
    'Non-binary',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    const double formLabelTextSize = 12.0;
    const double formTextSize = 14.0;
    const double formBorderWidth = 1.0;
    final Color formBorderColor = gray3;

    return Scaffold(
      appBar: MenuAppBar(title: "Sign up"),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Welcome to ',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: 'ForInTrip!\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Make your own trip with us!',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 26.0,
                          color: gray1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SignUpTextFormField(
                controller: _nicknameController,
                hintText: "Nickname",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a nickname';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              SignUpTextFormField(
                controller: _emailController,
                hintText: "email@gmail.com",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              SignUpTextFormField(
                controller: _passwordController,
                hintText: "Password",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(height: 8.0),
              SignUpTextFormField(
                controller: _passwordConfirmationController,
                hintText: "Confirm Password",
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                items: _genders
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a gender';
                  }
                  return null;
                },
                style: const TextStyle(fontSize: formTextSize),
                decoration: InputDecoration(
                  hintText: "Gender",
                  contentPadding: const EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: formBorderColor,
                      width: formBorderWidth,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Implement sign up logic
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize:
                      Size(double.infinity, 48), // Set button height to 80
                ),
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
