import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/controllers/bloc/pokemon_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/views/result_view/result_body.dart';
import 'package:pokedex/views/result_view/result_appbar.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final pokemonBloc = BlocProvider.getBloc<PokemonBloc>();

  bool pagination = false;

  changePage(int index) {
    pokemonBloc.pageIndex = index;
    pokemonBloc.pageOffset = pokemonBloc.pageLimit * pokemonBloc.pageIndex;

    setState(() {
      pokemonBloc.streamMultiplePokemon().then((value) => pagination = true);
    });
  }

  @override
  void initState() {
    super.initState();

    pokemonBloc.initResultPage();

    if (pokemonBloc.requestType == 'single') {
      pokemonBloc.addHistoryPokemon(pokemonBloc.requestText);
      pokemonBloc.streamSinglePokemon(pokemonBloc.requestText).catchError((_) {
        if (mounted) {
          setState(() {
            pokemonBloc.pageFind = false;
            pokemonBloc.pageReady = false;
          });
        }
      });
    } else if (pokemonBloc.requestType == 'multiple') {
      if (mounted) {
        changePage(pokemonBloc.pageIndex);
      }
    } else if (pokemonBloc.requestType == 'favorite') {
      pokemonBloc.streamFavoritePokemon().whenComplete(() {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return StreamBuilder<List<Pokemon>>(
      stream: pokemonBloc.pokemonStream.stream,
      builder: (context, snapshot) {
        if (pokemonBloc.pageFind == false) {
          return Scaffold(
            appBar: ResultBar(
              barCounter: (pokemonBloc.pageIndex).toString(),
              barHeight: deviceHeight * 0.12,
              barColor: Colors.white,
              barTitle: 'Resultado da Pesquisa', //Alterar com API
              barTitleColor: Colors.indigo.shade900,
              barTitleSize: 18,
              barSubTitle: 'Nenhum resultado encontrado', //Alterar com API
              barSubTitleColor: Colors.grey,
              barSubTitleSize: 16,
              barIconColor: Colors.indigo.shade900,
              barIconSize: 40,
              pagination: pagination,
              leftAction: () {},
              rightAction: () {},
            ),
            body: Container(
              width: deviceWidth,
              height: deviceHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.error, size: 50, color: Colors.indigo.shade900),
                  Text(
                    'Não encontrado',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.redAccent.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          if (snapshot.hasData && pokemonBloc.pageReady == true) {
            return Scaffold(
              appBar: ResultBar(
                barCounter: (pokemonBloc.pageIndex).toString(),
                barHeight: deviceHeight * 0.12,
                barColor: Colors.white,
                barTitle: 'Resultado da Pesquisa', //Alterar com API
                barTitleColor: Colors.indigo.shade900,
                barTitleSize: 18,
                barSubTitle: pokemonBloc.requestText, //Alterar com API
                barSubTitleColor: Colors.grey,
                barSubTitleSize: 16,
                barIconColor: Colors.indigo.shade900,
                barIconSize: 40,
                pagination: pagination,
                leftAction: () {
                  if (pokemonBloc.pageIndex > 1) {
                    pagination = false;
                    changePage(--pokemonBloc.pageIndex);
                  } else {
                    final snackBar = SnackBar(
                      content: Text('Pagina inicial'),
                      action: SnackBarAction(
                        label: 'Minimizar',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                rightAction: () {
                  pagination = false;
                  changePage(++pokemonBloc.pageIndex);
                },
              ),
              body: ResultBody(
                deviceWidth: deviceWidth,
                deviceHeight: deviceHeight,
                pokemon: snapshot.data!,
              ),
            );
          } else {
            return Scaffold(
              appBar: ResultBar(
                barCounter: (pokemonBloc.pageIndex).toString(),
                barHeight: deviceHeight * 0.12,
                barColor: Colors.white,
                barTitle: 'Resultado da Pesquisa', //Alterar com API
                barTitleColor: Colors.indigo.shade900,
                barTitleSize: 18,
                barSubTitle: 'Aguardando Resultado', //Alterar com API
                barSubTitleColor: Colors.grey,
                barSubTitleSize: 16,
                barIconColor: Colors.indigo.shade900,
                barIconSize: 40,
                pagination: pagination,
                leftAction: () {},
                rightAction: () {},
              ),
              body: Container(
                alignment: Alignment.center,
                width: deviceWidth * 1,
                height: deviceHeight * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(color: Colors.redAccent.shade400),
                    Text(
                      'Procurando',
                      style: TextStyle(
                        color: Colors.redAccent.shade400,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
      },
    );
  }
}
