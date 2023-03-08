import 'dart:async';
import 'package:bloc/bloc.dart';

// CounterBloc 이벤트
enum CounterEvent {
  increment,
  decrement,
}

// CounterBloc 클래스
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      if (event == CounterEvent.increment) {
        emit(state + 1);
      } else if (event == CounterEvent.decrement) {
        emit(state - 1);
      }
    });
  }
}
