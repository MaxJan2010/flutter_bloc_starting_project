part of 'name_state_bloc.dart';

sealed class NameStateEvent extends Equatable {
  const NameStateEvent();

  @override
  List<Object> get props => [];
}

class InitialNameEvent extends NameStateEvent {}

class FullNameEvent extends NameStateEvent {}

class ClearNameEvent extends NameStateEvent {}

class ResetNameEvent extends NameStateEvent {}
