import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_chart.dart';
import 'package:pokedex/widgets/result_card.dart';

class PokemonFunctions extends StatelessWidget {
  final double deviceWidth;
  final double deviceHeight;

  PokemonFunctions({
    required this.deviceWidth,
    required this.deviceHeight,
  });

  @override
  Widget build(BuildContext context) {
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

    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          width: deviceWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Características',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade900,
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.03,
                height: deviceHeight * 0.03,
              ),
              Text(
                'Peso',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade900,
                ),
              ),
              Text(
                '8,5 kg',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent.shade400,
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.03,
                height: deviceHeight * 0.03,
              ),
              Text(
                'Evoluções',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade900,
                ),
              ),
              ResultCard(
                pokemonImage: AssetImage(pokemon[0].pokemonImage.toString()),
                pokemonName: pokemon[0].pokemonName.toString(),
                pokemonType: pokemon[0].pokemonType.toString(),
              ),
              ResultCard(
                pokemonImage: AssetImage(pokemon[1].pokemonImage.toString()),
                pokemonName: pokemon[1].pokemonName.toString(),
                pokemonType: pokemon[1].pokemonType.toString(),
              ),
              SizedBox(
                width: deviceWidth * 0.03,
                height: deviceHeight * 0.03,
              ),
              Text(
                'Status Base',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade900,
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.03,
                height: deviceHeight * 0.03,
              ),
              BarChartSample3(),
              SizedBox(
                width: deviceWidth * 0.03,
                height: deviceHeight * 0.03,
              ),
              Text(
                'Habilidades',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade900,
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.01,
                height: deviceHeight * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.circle,
                      color: Colors.redAccent.shade400,
                      size: 12,
                    ),
                    SizedBox(
                      width: deviceWidth * 0.03,
                      height: deviceHeight * 0.03,
                    ),
                    Text(
                      'Choque do trovão',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.circle,
                      color: Colors.redAccent.shade400,
                      size: 12,
                    ),
                    SizedBox(
                      width: deviceWidth * 0.03,
                      height: deviceHeight * 0.03,
                    ),
                    Text(
                      'Rabada na cara',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
