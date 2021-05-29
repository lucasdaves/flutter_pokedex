import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/views/pokemon_view/pokemon_body.dart';
import 'package:pokedex/views/pokemon_view/pokemon_appbar.dart';

class PokemonPage extends StatefulWidget {
  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    Pokemon pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      appBar: PokemonBar(
        pokemonImage: NetworkImage(
            pokemon.pokemon_model.sprites.frontDefault), //Alterar com API
        barHeight: deviceHeight * 0.23,
        barColor: Colors.redAccent.shade400,
        barTitle: pokemon.pokemon_model.name, //Alterar com API
        barTitleColor: Colors.white,
        barTitleSize: 24,
        barSubTitle:
            pokemon.pokemon_model.types.first.type.name, //Alterar com API
        barSubTitleColor: Colors.white,
        barSubTitleSize: 16,
        barIcon: Icons.close, //Alterar com API
        barIconColor: Colors.white,
        barIconSize: 40,
      ),
      body: PokemonBody(
        deviceWidth: deviceWidth,
        deviceHeight: deviceHeight,
        pokemon: pokemon,
      ),
    );
  }
}
