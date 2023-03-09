import 'dart:async';
import 'dart:developer' as developer;

import 'package:for_in_trip/src/BLoC_Ex/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class YouAwesomeEvent {
  Stream<YouAwesomeState> applyAsync(
      {YouAwesomeState currentState, YouAwesomeBloc bloc});
}

class UnYouAwesomeEvent extends YouAwesomeEvent {
  @override
  Stream<YouAwesomeState> applyAsync(
      {YouAwesomeState? currentState, YouAwesomeBloc? bloc}) async* {
    yield UnYouAwesomeState();
  }
}

class LoadYouAwesomeEvent extends YouAwesomeEvent {
  @override
  Stream<YouAwesomeState> applyAsync(
      {YouAwesomeState? currentState, YouAwesomeBloc? bloc}) async* {
    try {
      yield UnYouAwesomeState();
      await Future.delayed(const Duration(seconds: 1));
      yield InYouAwesomeState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadYouAwesomeEvent', error: _, stackTrace: stackTrace);
      yield ErrorYouAwesomeState(_.toString());
    }
  }
}
