// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/character/character_collection.dart';
import '../../../data/repositories/characters.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharactersRepositories charactersRepositories;

  CharacterBloc(this.charactersRepositories) : super(CharacterInitialState()) {
    on<CharacterEvent>((event, emit) {
      if (event is GetCharacterEvent) {
        getCharacters(event.isRefreshed, event.page);
      }
    });
  }
  getCharacters(bool isRefreshed, int page) {
    if (state is CharacterLoadingState) return;
    final currentState = state;
    CharacterCollection characterCollection =
        CharacterCollection(character: [], error: '');
    if (currentState is CharacterLoadedState) {
      if (page == 1 && isRefreshed) {
        characterCollection = CharacterCollection(character: [], error: '');
      } else {
        characterCollection = currentState.characterCollection;
      }
    }
    emit(CharacterLoadingState(
        characterCollection: characterCollection, isFirstFetch: page == 1));
    charactersRepositories.getCharacters().then((character) {
      if (character.isEmpty) {
        characterCollection.error = "Data is Not Loaded";
        emit(CharacterErrorState(characterCollection: characterCollection));
      } else {
        final characters = (state as CharacterLoadingState).characterCollection;
        characters.character!.addAll(character);
        emit(CharacterLoadedState(characterCollection: characters));
      }
    });
  }
}
