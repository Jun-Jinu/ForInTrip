import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/sign_up_text_form_field.dart';
import '../widgets/appbar/menu_appbar.dart';
import '../theme/app_color.dart';
import './sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final bool _emailFieldIsEmpty = true;
  final bool _passwordFieldIsEmpty = true;
  bool _isButtonAbled = false; // 버튼 활성화, 비활성화

  void _onTextFieldChanged() {
    setState(() {
      _isButtonAbled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onTextFieldChanged);
    _passwordController.addListener(_onTextFieldChanged);
  }

  @override
  void dispose() {
    _emailController.removeListener(_onTextFieldChanged);
    _emailController.dispose();

    _passwordController.removeListener(_onTextFieldChanged);
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(title: "Log In"),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 64.0),
              SignUpTextFormField(
                controller: _emailController,
                hintText: "Email",
                validator: (value) {
                  if (_emailFieldIsEmpty) {
                    return 'Please enter an email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              SignUpTextFormField(
                controller: _passwordController,
                hintText: "Password",
                validator: (value) {
                  if (_passwordFieldIsEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: (_isButtonAbled)
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Implement login logic
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize:
                      Size(double.infinity, 48), // Set button height to 80
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Simply ",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: "sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.orange,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()),
                                );
                              },
                          ),
                          TextSpan(
                            text: " and make your own trip!",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
