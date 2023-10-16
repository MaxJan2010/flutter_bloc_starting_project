// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../config/dio.dart';
import '../config/endpoints.dart';

class CharactersApi {
  late Dio dio;

  CharactersApi() {
    dio = DioConfiguration.dio;
  }

  Future<List<dynamic>> getCharacters() async {
    try {
      var response = await dio.get(charactersUrl);
      return response.data;
    } on DioException catch (e) {
      print(e.message);
      return [];
    }
  }
}
