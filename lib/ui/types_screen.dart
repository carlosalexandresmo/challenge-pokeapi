import 'dart:convert';

import 'package:challenge_pokeapi/bloc/types_bloc.dart';
import 'package:challenge_pokeapi/components/Indicator.dart';
import 'package:challenge_pokeapi/models/list_pokemon.dart';
import 'package:challenge_pokeapi/models/pokemon.dart';
import 'package:challenge_pokeapi/ui/detail_screen.dart';
import 'package:challenge_pokeapi/utils/colors.dart';
import 'package:challenge_pokeapi/utils/helpers.dart';
import 'package:challenge_pokeapi/utils/string_extensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TypeScreen extends StatefulWidget {
  var value;

  TypeScreen({Key key, this.value}) : super(key: key);

  @override
  _TypeScreenState createState() => _TypeScreenState();
}

class _TypeScreenState extends State<TypeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  var _bloc = TypesBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchType(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: _body(),
    );
  }

  // Future<List<ListPokemon>> getTypesOfPokemon() async {
  //   TypeDetail detail = await _pokemonProvider.getType(widget.value);
  //   List<ListPokemon> list = detail.pokemon;
  //   return list;
  // }

  Widget _body() {
    return Container(
      child: StreamBuilder<List<ListPokemon>>(
        initialData: [],
        stream: _bloc.allPokemons,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Indicator(scale: 1.0, color: AppColors.primary);
                break;

              case ConnectionState.active:
                return Container(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: 16,
                    itemBuilder: (BuildContext context, int index) {
                      ListPokemon listPokemon = snapshot.data[index];
                      Pokemon pokemon = listPokemon.pokemon;

                      return ListTile(
                        title: Text(pokemon.name.capitalize()),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                  name: pokemon.name.capitalize(),
                                  value: Helpers.getParam(pokemon.url)),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
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
    );
  }
}
