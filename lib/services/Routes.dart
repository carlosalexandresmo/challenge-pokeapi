import 'package:challenge_pokeapi/ui/list_types_screen.dart';
import 'package:challenge_pokeapi/ui/pokemon_detail_screen.dart';
import 'package:challenge_pokeapi/ui/type_pokemon_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String listTypesRoute = '/list';
  static const String typesPokemonRoute = '/types';
  static const String pokemonDetailRoute = '/detail';

  static final routes = <String, WidgetBuilder>{
    listTypesRoute: (BuildContext context) => ListTypesScreen(),
    typesPokemonRoute: (BuildContext context) => TypePokemonScreen(),
    pokemonDetailRoute: (BuildContext context) => PokemonDetailScreen(),
  };

}
