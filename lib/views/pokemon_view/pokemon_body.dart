import 'package:flutter/material.dart';
import 'package:pokedex/controllers/api/api.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/views/pokemon_view/pokemon_chart.dart';
import 'package:pokedex/views/result_view/result_card.dart';

class PokemonBody extends StatefulWidget {
  final double deviceWidth;
  final double deviceHeight;
  final Pokemon pokemon;

  PokemonBody({
    required this.deviceWidth,
    required this.deviceHeight,
    required this.pokemon,
  });

  @override
  _PokemonBodyState createState() => _PokemonBodyState();
}

class _PokemonBodyState extends State<PokemonBody> {
  bool chain_loaded = false;
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Api.getChain(widget.pokemon.evolution_model).then((List<Pokemon> list) {
      if (mounted) {
        setState(() {
          widget.pokemon.evolution_chain = list;
          chain_loaded = true;
        });
      }
    });

    dynamic chain() {
      if (chain_loaded) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.pokemon.evolution_chain.length,
          itemBuilder: (context, index) {
            return ResultCard(
              pokemon: widget.pokemon.evolution_chain[index],
            );
          },
        );
      } else {
        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(color: Colors.redAccent.shade400),
              Text(
                'Procurando',
                style: TextStyle(
                  color: Colors.redAccent.shade400,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }
    }

    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          width: widget.deviceWidth,
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
                width: widget.deviceWidth * 0.03,
                height: widget.deviceHeight * 0.03,
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
                width: widget.deviceWidth * 0.01,
                height: widget.deviceHeight * 0.01,
              ),
              Text(
                '${widget.pokemon.pokemon_model.weight.toString()} KG',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent.shade400,
                ),
              ),
              SizedBox(
                width: widget.deviceWidth * 0.03,
                height: widget.deviceHeight * 0.03,
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
                width: widget.deviceWidth * 0.03,
                height: widget.deviceHeight * 0.03,
              ),
              chain(),
              SizedBox(
                width: widget.deviceWidth * 0.03,
                height: widget.deviceHeight * 0.03,
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
                width: widget.deviceWidth * 0.02,
                height: widget.deviceHeight * 0.02,
              ),
              Divider(),
              Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      width: widget.deviceWidth * 1.2,
                      height: widget.deviceHeight * 0.3,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          widget.deviceHeight * 0.02,
                          0,
                          widget.deviceHeight * 0.02,
                        ),
                        child: BarChartSample3(pokemon: widget.pokemon),
                      )),
                ),
              ),
              Divider(),
              SizedBox(
                width: widget.deviceWidth * 0.03,
                height: widget.deviceHeight * 0.03,
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
                width: widget.deviceWidth * 0.01,
                height: widget.deviceHeight * 0.01,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.pokemon.pokemon_model.abilities.length,
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
                          width: widget.deviceWidth * 0.03,
                          height: widget.deviceHeight * 0.03,
                        ),
                        Text(
                          widget.pokemon.pokemon_model.abilities[index].ability
                              .name,
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
                width: widget.deviceWidth * 0.03,
                height: widget.deviceHeight * 0.03,
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
                width: widget.deviceWidth * 0.01,
                height: widget.deviceHeight * 0.01,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.pokemon.pokemon_model.moves.length,
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
                          width: widget.deviceWidth * 0.03,
                          height: widget.deviceHeight * 0.03,
                        ),
                        Text(
                          widget.pokemon.pokemon_model.moves[index].move.name,
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
