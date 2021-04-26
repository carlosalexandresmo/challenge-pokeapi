import 'package:challenge_pokeapi/models/list_pokemon.dart';

class TypeDetail {
  int id;
  String name;
  List<ListPokemon> pokemon;

  TypeDetail({this.id, this.name, this.pokemon});

  TypeDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['pokemon'] != null) {
      pokemon = new List<ListPokemon>();
      json['pokemon'].forEach((v) {
        pokemon.add(new ListPokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}