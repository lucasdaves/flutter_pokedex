import 'package:flutter/material.dart';
import 'package:pokedex/views/home_page.dart';
import 'package:pokedex/views/pokemon_page.dart';
import 'package:pokedex/views/result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/pokemon_page',
      routes: {
        '/home_page': (context) => HomePage(),
        '/result_page': (context) => ResultPage(),
        '/pokemon_page': (context) => PokemonPage(),
      },
    );
  }
}
