import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controllers/bloc/pokemon_bloc.dart';

import 'views/home_view/home_page.dart';
import 'views/pokemon_view/pokemon_page.dart';
import 'views/result_view/result_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        highlightColor: Colors.indigo.shade900,
      ),
      initialRoute: '/home_page',
      routes: {
        '/home_page': (context) => HomePage(),
        '/result_page': (context) => ResultPage(),
        '/pokemon_page': (context) => PokemonPage(),
      },
    );

    return BlocProvider(
      child: app,
      blocs: [Bloc((i) => PokemonBloc())],
      dependencies: [],
    );
  }
}
