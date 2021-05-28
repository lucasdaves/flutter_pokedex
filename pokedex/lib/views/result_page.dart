import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/result_functions.dart';
import 'package:pokedex/widgets/result_appbar.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    List<Pokemon> pokemon = [];

    pokemon.add(Pokemon.fromJson(
      {
        "pokemonName": "Pikachu",
        "pokemonType": "Eletric",
        "pokemonImage": "images/logo.png",
      },
    ));

    pokemon.add(Pokemon.fromJson(
      {
        "pokemonName": "Charmander",
        "pokemonType": "Fire",
        "pokemonImage": "images/logo.png",
      },
    ));

    pokemon.add(Pokemon.fromJson(
      {
        "pokemonName": "Squirtle",
        "pokemonType": "Water",
        "pokemonImage": "images/logo.png",
      },
    ));

    return Scaffold(
      appBar: ResultBar(
        barHeight: deviceHeight * 0.12,
        barColor: Colors.white,
        barTitle: 'Resultado da Pesquisa', //Alterar com API
        barTitleColor: Colors.indigo.shade900,
        barTitleSize: 18,
        barSubTitle: 'Pikachu', //Alterar com API
        barSubTitleColor: Colors.grey,
        barSubTitleSize: 16,
        barIconColor: Colors.black,
        barIconSize: 100,
      ),
      body: ResultFunctions(
        deviceWidth: deviceWidth,
        deviceHeight: deviceHeight,
        pokemon: pokemon,
      ),
    );
  }
}
