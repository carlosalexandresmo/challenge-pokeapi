import 'package:challenge_pokeapi/models/DetailPokemon.dart';
import 'package:challenge_pokeapi/models/type.dart';
import 'package:challenge_pokeapi/models/type_detail.dart';

abstract class PokemonService {

  Future<List<Type>> getTypes();

  Future<TypeDetail> getType(id);

  Future<DetailPokemon> getPokemon(id);

}