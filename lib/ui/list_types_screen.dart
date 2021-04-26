import 'package:challenge_pokeapi/components/Indicator.dart';
import 'package:challenge_pokeapi/models/type.dart';
import 'package:challenge_pokeapi/services/PokeProvider.dart';
import 'package:challenge_pokeapi/utils/colors.dart';
import 'package:flutter/material.dart';

class ListTypesScreen extends StatefulWidget {
  @override
  _ListTypesScreenState createState() => _ListTypesScreenState();
}

class _ListTypesScreenState extends State<ListTypesScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  PokemonProvider _pokemonProvider = PokemonProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return FutureBuilder<List<Type>>(
        initialData: [],
        future: _pokemonProvider.getTypes(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Indicator(scale: 1.0, color: AppColors.primary);
              break;

            case ConnectionState.done:
              return Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {

                    Type type = snapshot.data[index];

                    return ListTile(
                      title: Text(type.name),
                    );
                  },
                  //scrollDirection: Axis.horizontal,
                ),
              );
              break;

            default:
              return Container();
              break;
          };
        }
    );
  }


}
