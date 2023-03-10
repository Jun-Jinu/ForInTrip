import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/home_screen.dart';
import 'package:for_in_trip/src/bloc/home_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (BuildContext context) => CounterBloc(),
      child: const HomeScreen(),
    );
  }
}
