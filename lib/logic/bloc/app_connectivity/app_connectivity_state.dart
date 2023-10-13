part of 'app_connectivity_bloc.dart';

sealed class AppConnectivityState extends Equatable {
  const AppConnectivityState();

  @override
  List<Object> get props => [];
}

class AppConnectivityInitialState extends AppConnectivityState {
  final String? connectivityMessage;

  const AppConnectivityInitialState({
    this.connectivityMessage,
  });

}

class AppConnectivityTrueState extends AppConnectivityState {
  final String connectivityMessage;

  const AppConnectivityTrueState({
    required this.connectivityMessage,
  });
}

class AppConnectivityFalseState extends AppConnectivityState {
  final String connectivityMessage;

  const AppConnectivityFalseState({
    required this.connectivityMessage,
  });
}

class InternetConnectivityErrorState extends AppConnectivityState {}
