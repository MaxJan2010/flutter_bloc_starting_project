part of 'check_internet_connectivity_bloc.dart';

sealed class CheckInternetConnectivityState extends Equatable {
  const CheckInternetConnectivityState();

  @override
  List<Object> get props => [];
}

class CheckInternetConnectivityInitialState extends CheckInternetConnectivityState {
  // 1- Generate Variables.
  final String? internetConnectivity;

  // 2- Generate Constructor with Variables.
  const CheckInternetConnectivityInitialState({
    this.internetConnectivity,
  });

  // 3- Copy the Above Steps to (InternetConnectivityTrue, InternetConnectivityFalse, InternetConnectivityError) States.
}

class InternetConnectivityTrueState extends CheckInternetConnectivityState {
  // 1- Generate Variables.
  final String internetConnectivity;

  // 2- Generate Constructor with Variables.
  const InternetConnectivityTrueState({
    required this.internetConnectivity,
  });
}

class InternetConnectivityFalseState extends CheckInternetConnectivityState {
  // 1- Generate Variables.
  final String internetConnectivity;

  // 2- Generate Constructor with Variables.
  const InternetConnectivityFalseState({
    required this.internetConnectivity,
  });
}

class InternetConnectivityErrorState extends CheckInternetConnectivityState {}
