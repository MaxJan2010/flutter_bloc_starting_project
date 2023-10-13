part of 'app_connectivity_bloc.dart';

sealed class AppConnectivityEvent extends Equatable {
  const AppConnectivityEvent();

  @override
  List<Object> get props => [];
}

class AppConnectedEvent extends AppConnectivityEvent {}

class AppNotConnectedEvent extends AppConnectivityEvent {}
