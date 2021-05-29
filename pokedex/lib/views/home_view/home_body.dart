import 'package:flutter/material.dart';
import 'package:pokedex/views/home_view/home_button.dart';
import 'package:pokedex/views/home_view/home_textfield.dart';

class HomeBody extends StatefulWidget {
  final double deviceWidth;
  final double deviceHeight;

  HomeBody({
    required this.deviceWidth,
    required this.deviceHeight,
  });

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final textfildController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: widget.deviceWidth * 0.9,
        height: widget.deviceHeight * 0.7,
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: widget.deviceWidth * 0.9,
              height: widget.deviceHeight * 0.03,
            ),
            SizedBox(
              width: widget.deviceWidth * 0.8,
              height: widget.deviceHeight * 0.07,
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
              width: widget.deviceWidth * 0.8,
              height: widget.deviceHeight * 0.1,
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
              width: widget.deviceWidth * 0.9,
              height: widget.deviceHeight * 0.05,
            ),
            HomeTextField(
              controller: textfildController,
              textLabel: 'Digite o nome do pokemon',
              width: widget.deviceWidth * 0.8,
              height: widget.deviceHeight * 0.06,
            ),
            SizedBox(
              width: widget.deviceWidth * 0.9,
              height: widget.deviceHeight * 0.1,
            ),
            FunctionButton(
              width: widget.deviceWidth * 0.8,
              height: widget.deviceHeight * 0.06,
              fontSize: 22,
              color: Colors.indigo.shade900,
              text: 'PESQUISAR',
              onClick: () {
                Navigator.pushNamed(
                  context,
                  '/result_page',
                  arguments: textfildController.text,
                );
              },
            ),
            SizedBox(
              width: widget.deviceWidth * 0.9,
              height: widget.deviceHeight * 0.02,
            ),
            FunctionButton(
              width: widget.deviceWidth * 0.8,
              height: widget.deviceHeight * 0.06,
              fontSize: 22,
              color: Colors.deepPurple,
              text: 'POKEVERSO',
              onClick: () {
                Navigator.pushNamed(
                  context,
                  '/result_page',
                  arguments: 'todos',
                );
              },
            ),
            SizedBox(
              width: widget.deviceWidth * 0.9,
              height: widget.deviceHeight * 0.02,
            ),
            FunctionButton(
              width: widget.deviceWidth * 0.8,
              height: widget.deviceHeight * 0.06,
              fontSize: 22,
              color: Colors.yellow.shade700,
              text: 'FAVORITOS',
              onClick: () {
                print('em progresso');
              },
            ),
          ],
        ),
      ),
    );
  }
}
