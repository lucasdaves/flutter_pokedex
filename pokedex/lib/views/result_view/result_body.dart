import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/controllers/bloc/pokemon_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/views/result_view/result_card.dart';

import 'result_history.dart';

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
    final pokemonBloc = BlocProvider.getBloc<PokemonBloc>();

    getHistory() {
      if (pokemonBloc.requestType == 'single') {
        return SizedBox(
          height: deviceHeight * 0.3,
          child: ResultHistory(
              deviceWidth: deviceWidth, deviceHeight: deviceHeight),
        );
      } else
        return SizedBox();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: pokemon.length,
            itemBuilder: (BuildContext context, int index) {
              return ResultCard(
                pokemon: pokemon[index],
              );
            },
          ),
        ),
        getHistory(),
      ],
    );
  }
}
