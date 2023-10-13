import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'app_connectivity_event.dart';
part 'app_connectivity_state.dart';

class AppConnectivityBloc
    extends Bloc<AppConnectivityEvent, AppConnectivityState> {
  StreamSubscription? connectivitySubscription;
  AppConnectivityBloc()
      : super(const AppConnectivityInitialState(connectivityMessage: '')) {
    on<AppConnectivityEvent>((event, emit) {
      if (event is AppConnectedEvent) {
        emit(const AppConnectivityTrueState(
            connectivityMessage: 'Internet Connected'));
      } else if (event is AppNotConnectedEvent) {
        emit(const AppConnectivityFalseState(
            connectivityMessage: 'Internet Is NOT Connected'));
      }
    });
    connectivitySubscription = Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        add(AppConnectedEvent());
      } else {
        add(AppNotConnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription!.cancel();
    return super.close();
  }
}
