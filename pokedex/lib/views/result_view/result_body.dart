import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/views/result_view/result_card.dart';

class ResultBody extends StatelessWidget {
  final double deviceWidth;
  final double deviceHeight;
  final List<Pokemon> pokemon;

  ResultBody({
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
          pokemon: pokemon[index],
        );
      },
    );
  }
}
