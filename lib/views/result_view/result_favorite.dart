import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/controllers/bloc/pokemon_bloc.dart';

class ResultFavorite extends StatefulWidget {
  final double deviceWidth;
  final double deviceHeight;

  ResultFavorite({
    required this.deviceWidth,
    required this.deviceHeight,
  });

  @override
  _ResultFavoriteState createState() => _ResultFavoriteState();
}

class _ResultFavoriteState extends State<ResultFavorite> {
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
                      'Pokemons',
                      style: TextStyle(
                          fontSize: widget.deviceWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade900),
                    ),
                  ),
                  Text(
                    '${pokemonBloc.pokemon_favorite.length}/${pokemonBloc.favoriteLimit}',
                    style: TextStyle(
                        fontSize: widget.deviceWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent.shade400),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, 0, widget.deviceWidth * 0.1, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        pokemonBloc
                            .resetFavoritePokemon()
                            .whenComplete(() => setState(() {
                                  Navigator.popAndPushNamed(
                                      context, '/result_page');
                                }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
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
          ],
        ));
  }
}
