import 'package:challenge_pokeapi/services/Routes.dart';
import 'package:challenge_pokeapi/ui/home_screen.dart';
import 'package:challenge_pokeapi/utils/colors.dart';
import 'package:challenge_pokeapi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.APP_NAME,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        accentColor: AppColors.accent,
      ),
      home: HomeScreen(),
      routes: Routes.routes,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt'),
      ],
    );
  }
}