// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'name_state_bloc.dart';

sealed class NameStateState extends Equatable {
  const NameStateState();

  @override
  List<Object> get props => [];
}

class NameStateInitial extends NameStateState {
  // 1- Generate Variables.
  final String? name;

  // 2- Generate Constructor with Variables.
  const NameStateInitial({
    this.name,
  });

  // 3- Copy the Above Steps to (Loading, Loaded, Error) States.
}

class NameStateLoading extends NameStateState {
  // 1- Generate Variables.
  final String? name;

  // 2- Generate Constructor with Variables.
  const NameStateLoading({
    this.name,
  });
}

class NameStateLoaded extends NameStateState {
  // 1- Generate Variables.
  final String? name;

  // 2- Generate Constructor with Variables.
  const NameStateLoaded({
    this.name,
  });
}

class NameStateError extends NameStateState {
  // 1- Generate Variables.
  final String? name;

  // 2- Generate Constructor with Variables.
  const NameStateError({
    this.name,
  });
}
