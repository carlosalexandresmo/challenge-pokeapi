import 'package:challenge_pokeapi/models/DetailPokemon.dart';
import 'package:challenge_pokeapi/models/type.dart';
import 'package:challenge_pokeapi/models/type_detail.dart';
import 'package:challenge_pokeapi/services/PokemonService.dart';
import 'package:challenge_pokeapi/utils/endpoints.dart';
import 'package:dio/dio.dart';

import 'CustomDio.dart';

class PokemonProvider implements PokemonService {
  Dio _dio = CustomDio().getEntityManagerFactory();

  @override
  Future<List<Type>> getTypes() async {
    try {
      final response = await _dio.get(Endpoints.type);
      return (response.data as List).map((e) => Type.fromJson(e)).toList();
    } catch (e) {
      if (e is DioError) {
        print(e.message);
      } else {
        print(e.toString());
        throw e;
      }
    }
  }

  @override
  Future<DetailPokemon> getPokemon(id) async {
    try {
      final response = await _dio.get('${Endpoints.pokemon}/$id');
      return DetailPokemon.fromJson(response.data);
    } catch (e) {
      if (e is DioError) {
        print(e.message);
      } else {
        print(e.toString());
        throw e;
      }
    }
  }

  @override
  Future<TypeDetail> getType(id) async {
    try {
      final response = await _dio.get('${Endpoints.type}/$id');
      return TypeDetail.fromJson(response.data);
    } catch (e) {
      if (e is DioError) {
        print(e.message);
      } else {
        print(e.toString());
        throw e;
      }
    }
  }

}