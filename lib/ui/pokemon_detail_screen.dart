import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: null
    );
  }

}
