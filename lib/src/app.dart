import 'package:flutter/material.dart';
import 'package:for_in_trip/src/ui/pages/home_page.dart';
import 'package:for_in_trip/src/ui/screens/splash_screen.dart';

class App extends MaterialApp {
  const App({super.key})
      : super(
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
}
