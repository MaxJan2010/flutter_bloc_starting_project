import '../api_services/characters.dart';
import '../models/character/character_model.dart';

class CharactersRepositories{
  final CharactersApi charactersApi;
  CharactersRepositories({required this.charactersApi});

  Future<List<CharactersModel>> getCharacters()async{
    var characters = await charactersApi.getCharacters();
    List<Map<String,dynamic>> charactersItems = List<Map<String,dynamic>>
    .from(characters);
    List<CharactersModel> seriesCharacters = CharactersModel.fromData(charactersItems);
    return seriesCharacters;
  }
}