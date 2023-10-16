part of 'character_bloc.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitialState extends CharacterState {}

class CharacterLoadingState extends CharacterState {
  final bool isFirstFetch;
  final CharacterCollection characterCollection;
  const CharacterLoadingState(
      {required this.characterCollection, this.isFirstFetch = false});
}

class CharacterLoadedState extends CharacterState {
  final CharacterCollection characterCollection;
  const CharacterLoadedState({required this.characterCollection});
}

class CharacterErrorState extends CharacterState {
  final CharacterCollection characterCollection;
  const CharacterErrorState({required this.characterCollection});
}
