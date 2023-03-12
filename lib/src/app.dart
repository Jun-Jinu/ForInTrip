import 'package:flutter/material.dart';
import 'package:for_in_trip/src/ui/screens/splash_screen.dart';
import 'package:for_in_trip/src/ui/pages/home_page.dart';
import 'package:for_in_trip/src/ui/pages/category_page.dart';

class App extends MaterialApp {
  const App({Key? key})
      : super(
          home: const SplashScreen(),
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (_) {
              return const HomePage();
            },
            '/second': (_) {
              return CategoryPage();
            },
          },
        );
}
