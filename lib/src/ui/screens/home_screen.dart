import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_in_trip/src/bloc/home_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
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
                  heroTag: 'decrement',
                  onPressed: () {
                    counterBloc.add(CounterEvent.decrement);
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 24.0),
                FloatingActionButton(
                  heroTag: 'increment',
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
    );
  }
}
