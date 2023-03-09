import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:for_in_trip/src/BLoC_Ex/index.dart';

class YouAwesomeBloc extends Bloc<YouAwesomeEvent, YouAwesomeState> {
  YouAwesomeBloc(YouAwesomeState initialState) : super(initialState) {
    on<YouAwesomeEvent>((event, emit) {
      return emit.forEach<YouAwesomeState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'YouAwesomeBloc', error: error, stackTrace: stackTrace);
          return ErrorYouAwesomeState(error.toString());
        },
      );
    });
  }
}
