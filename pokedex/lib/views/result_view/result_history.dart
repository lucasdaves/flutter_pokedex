import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/controllers/bloc/pokemon_bloc.dart';

class ResultHistory extends StatefulWidget {
  final double deviceWidth;
  final double deviceHeight;

  ResultHistory({
    required this.deviceWidth,
    required this.deviceHeight,
  });

  @override
  _ResultHistoryState createState() => _ResultHistoryState();
}

class _ResultHistoryState extends State<ResultHistory> {
  final pokemonBloc = BlocProvider.getBloc<PokemonBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: widget.deviceWidth,
              height: widget.deviceHeight * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(widget.deviceWidth * 0.1, 0, 0, 0),
                    child: Text(
                      'Histórico',
                      style: TextStyle(
                          fontSize: widget.deviceWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade900),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, 0, widget.deviceWidth * 0.1, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        pokemonBloc
                            .resetHistoryPokemon()
                            .whenComplete(() => setState(() {}));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(
                          width: 2,
                          color: Colors.redAccent.shade400,
                        ),
                      ),
                      child: Text(
                        'Limpar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent.shade400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: pokemonBloc.pokemon_history.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: widget.deviceHeight * 0.07,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        pokemonBloc.requestType = 'single';
                        pokemonBloc.requestText =
                            pokemonBloc.pokemon_history[index];
                        Navigator.pushNamed(
                          context,
                          '/result_page',
                        );
                      },
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  widget.deviceWidth * 0.1, 0, 0, 0),
                              child: Text(
                                pokemonBloc.pokemon_history[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, 0, widget.deviceWidth * 0.1, 0),
                              child: Icon(
                                Icons.timelapse,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
