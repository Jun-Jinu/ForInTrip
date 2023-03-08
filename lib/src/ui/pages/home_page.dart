import 'package:flutter/material.dart';
import 'package:for_in_trip/src/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = HomeBloc(UnHomeState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: HomeScreen(homeBloc: _homeBloc),
    );
  }
}