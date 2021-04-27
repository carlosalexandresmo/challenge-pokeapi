import 'dart:convert';

import 'package:challenge_pokeapi/bloc/detail_bloc.dart';
import 'package:challenge_pokeapi/components/Indicator.dart';
import 'package:challenge_pokeapi/models/DetailPokemon.dart';
import 'package:challenge_pokeapi/models/abilities.dart';
import 'package:challenge_pokeapi/models/stats.dart';
import 'package:challenge_pokeapi/services/PokemonProvider.dart';
import 'package:challenge_pokeapi/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  var value;
  String name = '';

  DetailScreen({Key key, this.value, this.name}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  PokemonProvider _pokemonProvider = PokemonProvider();
  Future<DetailPokemon> _pokemon;
  var _bloc = DetailBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //_pokemon = detailPokemon();
    _bloc.fetchPokemon(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.name ?? ""),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.share,
                  size: 24.0,
                ),
              )),
        ],
      ),
      //body: _body(),
      body: Container(
        child: Column(
          children: [
            Container(
              child: StreamBuilder<DetailPokemon>(
                initialData: DetailPokemon(),
                stream: _bloc.detailPokemon,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Indicator(scale: 1.0, color: AppColors.primary);
                        break;

                      case ConnectionState.active:
                        // List<Abilities> abilities = snapshot.data.abilities;
                        // List<Stats> stats = snapshot.data.stats;

                        if (!snapshot.hasData) {
                        } else {
                          return SingleChildScrollView(
                            child: Column(children: [
                              Text(json.encode(snapshot.data)),
                              Image.network(
                                snapshot.data.sprites.frontDefault,
                                fit: BoxFit.cover,
                              ),
                              Text(snapshot.data.name),
                              Text('${snapshot.data.height}'),
                              Text('${snapshot.data.weight}'),
                              // _habilidades(abilities),
                              // _estastisticas(stats),
                            ]),
                          );
                        }

                        break;

                      default:
                        return Container();
                        break;
                    }
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<DetailPokemon> detailPokemon() async {
    DetailPokemon detailPokemon =
        await _pokemonProvider.getPokemon(widget.value);

    //List<Result> list = type.results;
    //print(json.encode(list));
    return detailPokemon;
  }

  Widget _habilidades(List<Abilities> abilities) {
    return Column(
      children: List.generate(
        abilities.length,
        (index) {
          Abilities ability = abilities[index];
          return Text(ability.ability.name);
        },
      ),
    );
  }

  Widget _estastisticas(List<Stats> stats) {
    return Column(
      children: List.generate(
        stats.length,
        (index) {
          Stats stat = stats[index];
          return Container(
            child: Row(
              children: [
                Text(stat.stat.name),
                Text('${stat.baseStat}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
