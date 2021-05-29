import 'package:flutter/material.dart';

class PokemonBar extends StatelessWidget implements PreferredSizeWidget {
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
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: barColor,
      elevation: 0.0,
      centerTitle: false,
      leading: IconButton(
        icon: Icon(barIcon, size: barIconSize),
        onPressed: () =>
            Navigator.popUntil(context, ModalRoute.withName("/home_page")),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.star_border, size: barIconSize, color: barIconColor),
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('Pokemon Favoritado !'),
              action: SnackBarAction(
                label: 'Minimizar',
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ],
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
                  backgroundImage: pokemonImage,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  barTitle,
                  style: TextStyle(
                    color: barTitleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Tipo: $barSubTitle',
                  style: TextStyle(
                    color: barSubTitleColor,
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

  @override
  Size get preferredSize => Size.fromHeight(barHeight);
}
