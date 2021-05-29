import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class ResultCard extends StatelessWidget {
  final Pokemon pokemon;

  ResultCard({
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/pokemon_page', arguments: pokemon);
      },
      child: SizedBox(
        width: deviceWidth,
        height: deviceHeight * 0.12,
        child: Card(
          child: Center(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      deviceWidth * 0.02, 0, deviceWidth * 0.02, 0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.redAccent.shade400,
                    foregroundColor: Colors.redAccent.shade400,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          pokemon.pokemon_model.sprites.frontDefault),
                    ),
                  ),
                ),
                Flexible(
                  child: ListTile(
                    title: Text(
                      pokemon.pokemon_model.name,
                      style: TextStyle(
                        color: Colors.redAccent.shade400,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Tipo: ${pokemon.pokemon_model.types[0].type.name}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 40.0,
                      color: Colors.redAccent.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
