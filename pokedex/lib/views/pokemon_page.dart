import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_functions.dart';
import 'package:pokedex/widgets/pokemon_appbar.dart';

class PokemonPage extends StatefulWidget {
  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PokemonBar(
        pokemonImage: AssetImage('images/logo.png'), //Alterar com API
        barHeight: deviceHeight * 0.23,
        barColor: Colors.redAccent.shade400,
        barTitle: 'Pikachu', //Alterar com API
        barTitleColor: Colors.white,
        barTitleSize: 24,
        barSubTitle: 'Elétrico', //Alterar com API
        barSubTitleColor: Colors.white,
        barSubTitleSize: 16,
        barIcon: Icons.close, //Alterar com API
        barIconColor: Colors.white,
        barIconSize: 40,
      ),
      body: PokemonFunctions(
        deviceWidth: deviceWidth,
        deviceHeight: deviceHeight,
      ),
    );
  }
}
