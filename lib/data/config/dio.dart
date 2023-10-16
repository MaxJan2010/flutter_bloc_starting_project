import 'package:dio/dio.dart';

import 'server.dart';

class DioConfiguration {
  static BaseOptions options = BaseOptions(
    baseUrl: serverUrl + serviceApi + serviceRevision + serviceCode,
    sendTimeout: const Duration(milliseconds: 3000),
    connectTimeout: const Duration(milliseconds: 3000),
    receiveTimeout: const Duration(milliseconds: 3000),
    // headers: 
  );
  static Dio dio = Dio(options);
}
