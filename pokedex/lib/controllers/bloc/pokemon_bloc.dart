import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pokedex/models/evolution_model.dart';
import 'package:pokedex/models/list_pokemon.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/controllers/api/api.dart';
import 'package:rxdart/rxdart.dart';

class PokemonBloc extends BlocBase {
  late List<Pokemon> pokemon = [];

  late var pokemonStream = BehaviorSubject<List<Pokemon>>();

  Future<void> streamSinglePokemon(String text) async {
    pokemonStream = BehaviorSubject<List<Pokemon>>();

    PokemonModel pokemon_model = await Api.getPokemon(text);
    EvolutionModel evolution_model =
        await Api.getEvolution(pokemon_model.species.url);

    pokemon.clear();
    pokemon.add(Pokemon.createPokemon(pokemon_model, evolution_model));
    pokemonStream.sink.add(pokemon);
  }

  Future<void> streamMultiplePokemon() async {
    pokemonStream = BehaviorSubject<List<Pokemon>>();

    ListPokemon pokemonList = await Api.getPokemonList();

    //print(pokemonList.count);
    //print(pokemonList.results[0].name);

/*
    for (int i = 0; i < pokemonList.results.length; i++) {
      PokemonModel pokemon_model =
          await Api.getPokemon(pokemonList.results[i].name.toString());
      EvolutionModel evolution_model =
          await Api.getEvolution(pokemon_model.species.url);

      pokemon.clear();
      pokemon.add(Pokemon.createPokemon(pokemon_model, evolution_model));
      pokemonStream.sink.add(pokemon);
    }
    */
  }

  @override
  void dispose() {
    pokemonStream.close();
  }
}
