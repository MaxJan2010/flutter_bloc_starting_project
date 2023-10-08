part of 'check_internet_connectivity_bloc.dart';

sealed class CheckInternetConnectivityEvent extends Equatable {
  const CheckInternetConnectivityEvent();

  @override
  List<Object> get props => [];
}

class InternetConnectedEvent extends CheckInternetConnectivityEvent {}

class InternetNotConnectedEvent extends CheckInternetConnectivityEvent {}
