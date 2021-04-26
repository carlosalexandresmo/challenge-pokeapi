import 'package:challenge_pokeapi/components/Indicator.dart';
import 'package:challenge_pokeapi/models/type.dart';
import 'package:flutter/material.dart';

class TypePokemonScreen extends StatefulWidget {
  @override
  _TypePokemonScreenState createState() => _TypePokemonScreenState();
}

class _TypePokemonScreenState extends State<TypePokemonScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  var list = new List<Type>();

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
        //future: list,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Indicator();
              break;

            case ConnectionState.done:
              return Container(
                child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: 16,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(''),
                    );
                  },
                  scrollDirection: Axis.horizontal,
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
