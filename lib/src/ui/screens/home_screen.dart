import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_in_trip/src/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AppBar(
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "ForInTrip",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: grey,
                ),
              ),
            ),
            // Icon(
            //   Icons.arrow_back_ios,
            //   color: Colors.black,
            // ),
            // title: Text(
            //   '청원게시판',
            //   style: TextStyle(
            //     fontSize: 18.0,
            //     color: Colors.black,
            //   ),
            // ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.notifications), onPressed: null),
            ],
            centerTitle: true,
            backgroundColor: transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CounterBloc, int>(
                builder: (context, count) {
                  return Text(
                    '$count',
                    style: TextStyle(fontSize: 48.0),
                  );
                },
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      counterBloc.add(CounterEvent.decrement);
                    },
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                  SizedBox(width: 24.0),
                  FloatingActionButton(
                    onPressed: () {
                      counterBloc.add(CounterEvent.increment);
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
