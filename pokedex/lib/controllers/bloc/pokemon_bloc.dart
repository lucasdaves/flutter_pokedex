import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pokedex/models/evolution_model.dart';
import 'package:pokedex/models/list_pokemon.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/controllers/api/api.dart';
import 'package:rxdart/rxdart.dart';

class PokemonBloc extends BlocBase {
  late List<Pokemon> pokemons = [];
  late List<String> favorite_pokemons = [];

  late dynamic pokemonStream = BehaviorSubject<List<Pokemon>>();

  Future<void> streamSinglePokemon(String search) async {
    pokemonStream = BehaviorSubject<List<Pokemon>>();

    PokemonModel pokemon_model;
    EvolutionModel evolution_model;
    List<Pokemon> evolution_chain = [];

    pokemon_model = await Api.getPokemon(search);
    evolution_model = await Api.getEvolution(pokemon_model.species.url);

    pokemons.clear();
    pokemons.add(
      Pokemon.createPokemon(
        pokemon_model,
        evolution_model,
        evolution_chain,
      ),
    );

    pokemonStream.sink.add(pokemons);
  }

  Future<void> streamMultiplePokemon(String search) async {
    pokemonStream = BehaviorSubject<List<Pokemon>>();

    pokemons.clear();

    PokemonModel pokemon_model;
    EvolutionModel evolution_model;
    List<Pokemon> evolution_chain = [];

    ListPokemon pokemonList = await Api.getPokemonList(search);

    for (int i = 0; i < pokemonList.results.length; i++) {
      pokemon_model = await Api.getPokemon(pokemonList.results[i].name);
      evolution_model = await Api.getEvolution(pokemon_model.species.url);

      pokemons.add(
        Pokemon.createPokemon(
          pokemon_model,
          evolution_model,
          evolution_chain,
        ),
      );
    }
    pokemonStream.sink.add(pokemons);
  }

  @override
  void dispose() {
    pokemonStream.close();
    super.dispose();
  }
}
