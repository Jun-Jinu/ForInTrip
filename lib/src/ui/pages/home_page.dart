import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/home_screen.dart';
import 'package:for_in_trip/src/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: BlocProvider<CounterBloc>(
        create: (BuildContext context) => CounterBloc(),
        child: CounterScreen(),
      ),
    );
  }
}
