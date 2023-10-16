// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

//ignore: must_be_immutable
class GetCharacterEvent extends CharacterEvent {
  bool isRefreshed;
  int page;
  // bool stopSearching;
  GetCharacterEvent({
    required this.isRefreshed,
    required this.page,
    // required this.stopSearching,
  });

}
