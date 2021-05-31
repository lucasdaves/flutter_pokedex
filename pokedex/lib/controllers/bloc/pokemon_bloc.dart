import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pokedex/models/evolution_model.dart';
import 'package:pokedex/models/list_pokemon.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/controllers/api/api.dart';
import 'package:rxdart/rxdart.dart';

class PokemonBloc extends BlocBase {
  late List<Pokemon> pokemon = [];
  late List<Pokemon> pokemonEvolution = [];

  late var pokemonStream = BehaviorSubject<List<Pokemon>>();

  Future<void> streamSinglePokemon(String text) async {
    pokemonStream = BehaviorSubject<List<Pokemon>>();

    PokemonModel pokemon_model = await Api.getPokemon(text);
    EvolutionModel evolution_model =
        await Api.getEvolution(pokemon_model.species.url);

    pokemonEvolution.clear();
    pokemon.clear();

    for (var evolution1 in evolution_model.chain.evolvesTo) {
      if (evolution1 != null) {
        for (var evolution2 in evolution1.evolvesTo) {
          getEvolution(evolution2.species.name);
        }
      }
      getEvolution(evolution1.species.name);
    }

    pokemon.add(Pokemon.createPokemon(
        pokemon_model, evolution_model, pokemonEvolution));

    pokemonStream.sink.add(pokemon);
  }

  Future<void> streamMultiplePokemon() async {
    pokemonStream = BehaviorSubject<List<Pokemon>>();

    ListPokemon pokemonList = await Api.getPokemonList();
    pokemon.clear();

    for (int i = 0; i < pokemonList.results.length; i++) {
      PokemonModel pokemon_model =
          await Api.getPokemon(pokemonList.results[i].name.toString());
      EvolutionModel evolution_model =
          await Api.getEvolution(pokemon_model.species.url);

      pokemon.add(Pokemon.createPokemon(
          pokemon_model, evolution_model, pokemonEvolution));
    }
    pokemonStream.sink.add(pokemon);
  }

  Future<void> getEvolution(String text) async {
    PokemonModel pokemon_model = await Api.getPokemon(text);
    EvolutionModel evolution_model =
        await Api.getEvolution(pokemon_model.species.url);

    pokemonEvolution.add(Pokemon.createPokemon(
        pokemon_model, evolution_model, pokemonEvolution));
  }

  @override
  void dispose() {
    pokemonStream.close();
    super.dispose();
  }
}
