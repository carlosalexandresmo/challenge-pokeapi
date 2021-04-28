import 'package:challenge_pokeapi/models/detail_pokemon.dart';
import 'package:challenge_pokeapi/models/model_base.dart';
import 'package:challenge_pokeapi/models/type_detail.dart';
import 'package:challenge_pokeapi/services/PokemonProvider.dart';

class PokemonRepository {
  final pokemonApiProvider = PokemonProvider();

  Future<Type> fetchAllTypes() => pokemonApiProvider.getTypes();
  Future<TypeDetail> fetchType(id) => pokemonApiProvider.getType(id);
  Future<DetailPokemon> fetchPokemon(id) => pokemonApiProvider.getPokemon(id);

}