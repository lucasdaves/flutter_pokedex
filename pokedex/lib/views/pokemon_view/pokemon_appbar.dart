import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/controllers/bloc/pokemon_bloc.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonBar extends StatefulWidget implements PreferredSizeWidget {
  final NetworkImage pokemonImage;
  final double barHeight;
  final Color barColor;
  final String barTitle;
  final Color barTitleColor;
  final double barTitleSize;
  final String barSubTitle;
  final Color barSubTitleColor;
  final double barSubTitleSize;
  final IconData barIcon;
  final Color barIconColor;
  final double barIconSize;
  final Pokemon pokemon;

  PokemonBar({
    required this.pokemonImage,
    required this.barHeight,
    required this.barColor,
    required this.barTitle,
    required this.barTitleColor,
    required this.barTitleSize,
    required this.barSubTitle,
    required this.barSubTitleColor,
    required this.barSubTitleSize,
    required this.barIcon,
    required this.barIconColor,
    required this.barIconSize,
    required this.pokemon,
  });

  final pokemonBloc = BlocProvider.getBloc<PokemonBloc>();

  @override
  _PokemonBarState createState() => _PokemonBarState();

  @override
  Size get preferredSize => Size.fromHeight(barHeight);
}

class _PokemonBarState extends State<PokemonBar> {
  dynamic favoriteIcon = Icons.star_border;
  String snackBarText = "";

  @override
  initState() {
    super.initState();

    //pokemonBloc.resetFavoritePokemon();

    for (var name in widget.pokemonBloc.pokemon_favorite) {
      if (name == widget.pokemon.pokemon_model.name) {
        favoriteIcon = Icons.star;
        break;
      } else
        favoriteIcon = Icons.star_border;
    }
  }

  changeFavorite() {
    bool achou = false;

    for (var name in widget.pokemonBloc.pokemon_favorite) {
      if (name == widget.pokemon.pokemon_model.name) {
        snackBarText = "Pokemon Removido dos favoritos !";
        achou = true;
        break;
      } else {
        snackBarText = "Pokemon Adicionado aos favoritos !";
        achou = false;
      }
    }

    if (achou) {
      widget.pokemonBloc
          .removeFavoritePokemon(widget.pokemon.pokemon_model.name)
          .whenComplete(() => setState(() {
                snackBarText = "Pokemon Adicionado aos favoritos !";
                print(widget.pokemonBloc.pokemon_favorite);
                favoriteIcon = Icons.star_border;
              }));
    } else {
      widget.pokemonBloc
          .addFavoritePokemon(widget.pokemon.pokemon_model.name)
          .whenComplete(() => setState(() {
                snackBarText = "Pokemon Removido dos favoritos !";
                print(widget.pokemonBloc.pokemon_favorite);
                favoriteIcon = Icons.star;
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.barColor,
      elevation: 0.0,
      centerTitle: false,
      leading: IconButton(
        icon: Icon(widget.barIcon, size: widget.barIconSize),
        onPressed: () =>
            Navigator.popUntil(context, ModalRoute.withName("/result_page")),
      ),
      bottom: PreferredSize(
        child: Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.fromLTRB(0, 0, 30, 30),
          child: IconButton(
            icon: Icon(favoriteIcon,
                size: widget.barIconSize, color: widget.barIconColor),
            onPressed: () {
              changeFavorite();

              final snackBar = SnackBar(
                content: Text(snackBarText),
                action: SnackBarAction(
                  label: 'Minimizar',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
        preferredSize: Size.fromHeight(widget.barIconSize),
      ),
      flexibleSpace: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.redAccent.shade100,
                  backgroundImage: widget.pokemonImage,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.barTitle,
                  style: TextStyle(
                    color: widget.barTitleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Tipo: ${widget.barSubTitle}',
                  style: TextStyle(
                    color: widget.barSubTitleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
