import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'check_internet_connectivity_event.dart';
part 'check_internet_connectivity_state.dart';

class CheckInternetConnectivityBloc extends Bloc<CheckInternetConnectivityEvent,
    CheckInternetConnectivityState> {
  // 1- Generate the Variables.
  static String internetMessage = '';
  StreamSubscription? subscription;
  CheckInternetConnectivityBloc()
      : super(CheckInternetConnectivityInitialState(
            internetConnectivity: internetMessage)) {
    on<CheckInternetConnectivityEvent>((event, emit) {
      // 2- Clarify Events and Emits(States)
      if (event is InternetConnectedEvent) {
        internetMessage = 'Internet Connected';
        emit(InternetConnectivityTrueState(
            internetConnectivity: internetMessage));
      } else if (event is InternetNotConnectedEvent) {
        internetMessage = 'Internet Is NOT Connected';
        emit(InternetConnectivityFalseState(
            internetConnectivity: internetMessage));
      }
    });
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        add(InternetConnectedEvent());
      } else {
        add(InternetNotConnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }
}
