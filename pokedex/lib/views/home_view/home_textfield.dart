import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/controllers/bloc/pokemon_bloc.dart';

class HomeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String textLabel;
  final double width;
  final double height;

  HomeTextField({
    required this.controller,
    required this.textLabel,
    required this.width,
    required this.height,
  });

  final pokemonBloc = BlocProvider.getBloc<PokemonBloc>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.white, // set border color
              width: 1.0), // set border width
          borderRadius: BorderRadius.all(Radius.circular(90.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!.withOpacity(1),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(width * 0.1, 0, 0, 0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              hintText: textLabel,
              suffixIcon: GestureDetector(
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      pokemonBloc.requestType = 'single';
                      pokemonBloc.requestText = controller.text;
                      Navigator.pushNamed(
                        context,
                        '/result_page',
                      );
                    } else {
                      final snackBar = SnackBar(
                        content: Text('Digite o nome do pokemon !'),
                        action: SnackBarAction(
                          label: 'Minimizar',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Icon(Icons.search)),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
