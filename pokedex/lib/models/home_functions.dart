import 'package:flutter/material.dart';
import 'package:pokedex/widgets/home_button.dart';
import 'package:pokedex/widgets/home_textfield.dart';

class HomeFunctions extends StatelessWidget {
  final double deviceWidth;
  final double deviceHeight;

  HomeFunctions({
    required this.deviceWidth,
    required this.deviceHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: deviceWidth * 0.9,
        height: deviceHeight * 0.7,
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: deviceWidth * 0.9,
              height: deviceHeight * 0.03,
            ),
            SizedBox(
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.07,
              child: Text(
                'Conheça a Pokedex',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.indigo[900]),
              ),
            ),
            SizedBox(
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.1,
              child: Text(
                'Utilize a pokedex para encontrar mais informações sobre seus pokemons.',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontSize: 18.0,
                    color: Colors.indigo[900]),
              ),
            ),
            SizedBox(
              width: deviceWidth * 0.9,
              height: deviceHeight * 0.05,
            ),
            HomeTextField(
              textLabel: 'Digite o nome do pokemon',
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.06,
            ),
            SizedBox(
              width: deviceWidth * 0.9,
              height: deviceHeight * 0.1,
            ),
            FunctionButton(
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.06,
              fontSize: 22,
              color: Colors.indigo.shade900,
              text: 'PESQUISAR',
              onClick: () {
                Navigator.pushNamed(context, '/result_page');
              },
            ),
            SizedBox(
              width: deviceWidth * 0.9,
              height: deviceHeight * 0.02,
            ),
            FunctionButton(
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.06,
              fontSize: 22,
              color: Colors.deepPurple,
              text: 'POKEVERSO',
              onClick: () {},
            ),
            SizedBox(
              width: deviceWidth * 0.9,
              height: deviceHeight * 0.02,
            ),
            FunctionButton(
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.06,
              fontSize: 22,
              color: Colors.yellow.shade700,
              text: 'FAVORITOS',
              onClick: () {
                print('alo cowboy');
              },
            ),
          ],
        ),
      ),
    );
  }
}
