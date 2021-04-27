import 'package:challenge_pokeapi/bloc/home_bloc.dart';
import 'package:challenge_pokeapi/ui/types_screen.dart';
import 'package:challenge_pokeapi/utils/helpers.dart';
import 'package:challenge_pokeapi/utils/string_extensions.dart';
import 'package:challenge_pokeapi/components/Indicator.dart';
import 'package:challenge_pokeapi/models/result.dart';
import 'package:challenge_pokeapi/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  var _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchTypes();
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
    return Container(
      child: StreamBuilder<List<Result>>(
        initialData: [],
        stream: _bloc.results,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            print('snapshot.data');
            print(snapshot.data);

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Indicator(scale: 1.0, color: AppColors.primary);
                break;

              case ConnectionState.active:
                return Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Result result = snapshot.data[index];

                      return ListTile(
                        title: Text(result.name.capitalize()),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          print(result.url);
                          print(Helpers.getParam(result.url));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TypeScreen(
                                  value: Helpers.getParam(result.url)),
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
