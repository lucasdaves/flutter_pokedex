import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/result_card.dart';

class ResultFunctions extends StatelessWidget {
  final double deviceWidth;
  final double deviceHeight;
  final List<Pokemon> pokemon;

  ResultFunctions({
    required this.deviceWidth,
    required this.deviceHeight,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: pokemon.length,
      itemBuilder: (BuildContext context, int index) {
        return ResultCard(
          pokemonImage: AssetImage(pokemon[index].pokemonImage.toString()),
          pokemonName: pokemon[index].pokemonName.toString(),
          pokemonType: pokemon[index].pokemonType.toString(),
        );
      },
    );
  }
}
