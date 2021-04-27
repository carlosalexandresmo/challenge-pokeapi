import 'package:challenge_pokeapi/ui/home_screen.dart';
import 'package:challenge_pokeapi/ui/detail_screen.dart';
import 'package:challenge_pokeapi/ui/types_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String typesPokemonRoute = '/types';
  static const String pokemonDetailRoute = '/detail';

  static final routes = <String, WidgetBuilder>{
    homeRoute: (BuildContext context) => HomeScreen(),
    typesPokemonRoute: (BuildContext context) => TypeScreen(),
    pokemonDetailRoute: (BuildContext context) => DetailScreen(),
  };

}
