import 'package:flutter/material.dart';
import 'package:for_in_trip/src/ui/screens/splash_screen.dart';
import 'package:for_in_trip/src/ui/pages/home_page.dart';
import 'package:for_in_trip/src/ui/pages/category_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/search': (context) => const CategoryPage(),
        '/saved': (context) => const CategoryPage(),
        '/more': (context) => const CategoryPage(),
      },
    );
  }
}
