import 'package:flutter/material.dart';
import 'package:for_in_trip/src/ui/pages/splash_page.dart';
import 'package:for_in_trip/src/ui/screens/splash_screen.dart';
import 'package:for_in_trip/src/ui/pages/home_page.dart';
import 'package:for_in_trip/src/ui/pages/category_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: SplashScreen(),
    );
  }
}
