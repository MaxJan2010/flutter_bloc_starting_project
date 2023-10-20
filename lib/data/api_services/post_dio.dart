// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../config/dio.dart';
import '../config/endpoints.dart';

class PostApi {
  late Dio dio;

  PostApi() {
    dio = DioConfiguration.dio;
  }

  Future<List<dynamic>> getPostsList() async {
    try {
      var response = await dio.get(postUrl);
      return response.data;
    } on DioException catch (e) {
      print(e.message);
      return [];
    }
  }
}

