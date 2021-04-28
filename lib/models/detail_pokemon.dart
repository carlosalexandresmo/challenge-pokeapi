import 'package:challenge_pokeapi/models/abilities.dart';
import 'package:challenge_pokeapi/models/sprite.dart';
import 'package:challenge_pokeapi/models/stats.dart';

class DetailPokemon {
  List<Abilities> abilities;
  int baseExperience;
  int height;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  String name;
  int order;
  Sprites sprites;
  int weight;
  List<Stats> stats;

  DetailPokemon(
      {this.abilities,
      this.baseExperience,
      this.height,
      this.id,
      this.isDefault,
      this.locationAreaEncounters,
      this.name,
      this.order,
      this.sprites,
      this.weight,
      this.stats});

  DetailPokemon.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = new List<Abilities>();
      json['abilities'].forEach((v) {
        abilities.add(new Abilities.fromJson(v));
      });
    }
    baseExperience = json['base_experience'];
    height = json['height'];
    id = json['id'];
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters'];
    name = json['name'];
    order = json['order'];
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    weight = json['weight'];
    if (json['stats'] != null) {
      stats = new List<Stats>();
      json['stats'].forEach((v) {
        stats.add(new Stats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilities != null) {
      data['abilities'] = this.abilities.map((v) => v.toJson()).toList();
    }
    data['base_experience'] = this.baseExperience;
    data['height'] = this.height;
    data['id'] = this.id;
    data['is_default'] = this.isDefault;
    data['location_area_encounters'] = this.locationAreaEncounters;
    data['name'] = this.name;
    data['order'] = this.order;
    if (this.sprites != null) {
      data['sprites'] = this.sprites.toJson();
    }
    data['weight'] = this.weight;
    if (this.stats != null) {
      data['stats'] = this.stats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
