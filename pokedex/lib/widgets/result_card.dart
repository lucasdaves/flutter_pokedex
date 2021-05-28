import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final AssetImage pokemonImage;
  final String pokemonName;
  final String pokemonType;

  ResultCard({
    required this.pokemonImage,
    required this.pokemonName,
    required this.pokemonType,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/pokemon_page');
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
                      backgroundImage: pokemonImage,
                    ),
                  ),
                ),
                Flexible(
                  child: ListTile(
                    title: Text(
                      pokemonName,
                      style: TextStyle(
                        color: Colors.redAccent.shade400,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Tipo: $pokemonType',
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
