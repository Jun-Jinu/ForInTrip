import 'package:flutter/material.dart';
import 'package:for_in_trip/src/ui/screens/common_menu/splash_screen.dart';

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
