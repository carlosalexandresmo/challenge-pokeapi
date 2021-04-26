import 'package:dio/dio.dart';

class CustomDio {
  static final CustomDio _singleton = CustomDio._internal();

  factory CustomDio() => _singleton;

  Dio dio;

  Dio getEntityManagerFactory() {
    if (dio == null) {
      dio = new Dio(
        BaseOptions(
          baseUrl: "https://pokeapi.co/api/v2",
        ),
      );
    }
    return dio;
  }

  CustomDio._internal();
}