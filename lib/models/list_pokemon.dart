
import 'pokemon.dart';

class ListPokemon {
  Pokemon pokemon;

  ListPokemon({this.pokemon});

  ListPokemon.fromJson(Map<String, dynamic> json) {
    pokemon =
    json['pokemon'] != null ? new Pokemon.fromJson(json['pokemon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.toJson();
    }
    return data;
  }
}