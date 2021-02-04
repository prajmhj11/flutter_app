import 'package:dio/dio.dart';
import 'package:flutter_app/base_url.dart';

class AppApi {
  static BaseOptions _baseOptions = new BaseOptions(baseUrl: BASE_URL);

  // For unauthenticated apis
  static Dio dio = new Dio(_baseOptions);

  // Authenticated routes
  static Dio dioAuth() {
    return Dio();
  }
}
