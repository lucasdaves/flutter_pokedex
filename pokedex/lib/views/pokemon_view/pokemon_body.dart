import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/views/pokemon_view/pokemon_chart.dart';
import 'package:pokedex/views/result_view/result_card.dart';

class PokemonBody extends StatelessWidget {
  final double deviceWidth;
  final double deviceHeight;
  Pokemon pokemon;

  PokemonBody({
    required this.deviceWidth,
    required this.deviceHeight,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                width: deviceWidth * 0.01,
                height: deviceHeight * 0.01,
              ),
              Text(
                '${pokemon.pokemon_model.weight.toString()} KG',
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
              SizedBox(
                width: deviceWidth * 0.03,
                height: deviceHeight * 0.03,
              ),
              Divider(),
              SizedBox(
                width: deviceWidth * 0.9,
                height: deviceHeight * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ResultCard(
                      pokemon: pokemon,
                    );
                  },
                ),
              ),
              Divider(),
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
                width: deviceWidth * 0.02,
                height: deviceHeight * 0.02,
              ),
              Divider(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    width: deviceWidth * 1.2,
                    height: deviceHeight * 0.3,
                    child: BarChartSample3(pokemon: pokemon)),
              ),
              Divider(),
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
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: pokemon.pokemon_model.abilities.length,
                itemBuilder: (context, index) {
                  return Padding(
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
                          pokemon.pokemon_model.abilities[index].ability.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent.shade400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                width: deviceWidth * 0.03,
                height: deviceHeight * 0.03,
              ),
              Text(
                'Movimentos',
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
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: pokemon.pokemon_model.moves.length,
                itemBuilder: (context, index) {
                  return Padding(
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
                          pokemon.pokemon_model.moves[index].move.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent.shade400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
