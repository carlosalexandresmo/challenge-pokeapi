import 'package:challenge_pokeapi/bloc/detail_bloc.dart';
import 'package:challenge_pokeapi/components/Indicator.dart';
import 'package:challenge_pokeapi/models/detail_pokemon.dart';
import 'package:challenge_pokeapi/models/abilities.dart';
import 'package:challenge_pokeapi/services/PokemonProvider.dart';
import 'package:challenge_pokeapi/utils/colors.dart';
import 'package:challenge_pokeapi/utils/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

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
  var _bloc = DetailBloc();
  var content = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bloc.fetchPokemon(widget.value);
  }

  void shared() {
    Share.share(content, subject: 'Quem é esse pokémon?');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          widget.name ?? "",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {
                  shared();
                },
                child: Icon(
                  Icons.share,
                  size: 24.0,
                ),
              )),
        ],
      ),
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
                        return Indicator(scale: 1.0, color: AppColors.accent);
                        break;

                      case ConnectionState.active:
                        List<Abilities> abilities = snapshot.data.abilities;
                        content = 'Aqui é o pokemon ${snapshot.data.name}, o nº ${snapshot.data.id}. Com altura de ${snapshot.data.height / 10}m e pesando ${snapshot.data.weight / 10}kg. Suas principais habilidades são: ${abilities.map((e) => e.ability.name).toString()}';

                        print(content);
                        if (!snapshot.hasData) {
                        } else {
                          return SingleChildScrollView(
                            child: Column(children: [
                              Image.network(
                                snapshot.data.sprites.frontDefault,
                                scale: 0.6,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                '${snapshot.data.name}'.capitalize(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: AppColors.accent,
                                        fontWeight: FontWeight.bold),
                              ),
                              Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 32.0),
                                  color: Colors.grey[300],
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Nº ${snapshot.data.id}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(fontSize: 20)),
                                      Text(
                                          'Altura: ${snapshot.data.height / 10} m',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(fontSize: 20)),
                                      Text(
                                          'Peso: ${snapshot.data.weight / 10} kg',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(fontSize: 20)),
                                      SizedBox(height: 16),
                                      _habilidades(abilities),
                                      //_estastisticas(stats),
                                    ],
                                  )),
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

  Widget _habilidades(List<Abilities> abilities) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Habilidades:',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: AppColors.accent)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          abilities.length,
          (index) {
            Abilities ability = abilities[index];
            return Chip(
                label: Text('• ${ability.ability.name}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 20)),
                backgroundColor: AppColors.electric);
          },
        ),
      )
    ]);
  }

}
