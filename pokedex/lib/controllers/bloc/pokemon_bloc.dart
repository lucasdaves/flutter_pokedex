import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pokedex/controllers/persistence/shared_preferences.dart';
import 'package:pokedex/models/evolution_model.dart';
import 'package:pokedex/models/list_pokemon.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/controllers/api/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonBloc extends BlocBase {
  late SharedPreferences sharedPreferences;

  ////===POKEMON_HISTORY===////
  late List<String> pokemon_history =
      InternalMemory.read('history', sharedPreferences);

  Future<void> addHistoryPokemon(String data) async {
    sharedPreferences = await SharedPreferences.getInstance();

    List<String> aux = InternalMemory.read('history', sharedPreferences);
    aux.add(data);
    InternalMemory.save('history', sharedPreferences, aux);

    pokemon_history = InternalMemory.read('history', sharedPreferences);
  }

  Future<void> resetHistoryPokemon() async {
    sharedPreferences = await SharedPreferences.getInstance();
    InternalMemory.remove('history', sharedPreferences);
    pokemon_history = [];
  }
  ////===POKEMON_HISTORY===////

  ////===POKEMON_FAVORITE===////
  late List<String> pokemon_favorite =
      InternalMemory.read('favorite', sharedPreferences);

  Future<void> addFavoritePokemon(String data) async {
    sharedPreferences = await SharedPreferences.getInstance();

    List<String> aux = InternalMemory.read('favorite', sharedPreferences);
    aux.add(data);
    InternalMemory.save('favorite', sharedPreferences, aux);

    pokemon_favorite = InternalMemory.read('favorite', sharedPreferences);

    print(pokemon_favorite);
  }

  Future<void> resetFavoritePokemon() async {
    sharedPreferences = await SharedPreferences.getInstance();
    InternalMemory.remove('favorite', sharedPreferences);
    pokemon_favorite = [];
  }

  Future<void> removeFavoritePokemon(String data) async {
    sharedPreferences = await SharedPreferences.getInstance();

    List<String> aux = InternalMemory.read('favorite', sharedPreferences);

    for (var i = 0; i < aux.length; i++) {
      if (data == aux[i]) {
        aux.removeAt(i);

        InternalMemory.save('favorite', sharedPreferences, aux);
        pokemon_favorite = InternalMemory.read('favorite', sharedPreferences);

        break;
      }
    }
  }
  ////===POKEMON_FAVORITE===////

  ////===RESULT_PAGE===////
  late int pageIndex;
  late int pageLimit;
  late int pageOffset;

  late bool pageFind;
  late bool pageReady;

  late String requestType;
  late String requestText;

  late List<Pokemon> pokemons = [];
  late dynamic pokemonStream = BehaviorSubject<List<Pokemon>>();

  void initResultPage() {
    pageFind = true;
    pageReady = false;
    pageIndex = 1;
    pageLimit = 15;
    pageOffset = pageIndex * pageLimit;
  }

  Future<void> streamSinglePokemon(String search) async {
    pageReady = false;
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

    pageReady = true;
  }

  Future<void> streamMultiplePokemon() async {
    pageReady = false;
    pokemonStream = BehaviorSubject<List<Pokemon>>();

    pokemons.clear();

    String search = '?offset=${pageOffset}&limit=${pageLimit}';

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

    pageReady = true;
  }

  Future<void> streamFavoritePokemon() async {
    sharedPreferences = await SharedPreferences.getInstance();
    pageReady = false;
    pokemonStream = BehaviorSubject<List<Pokemon>>();

    pokemons.clear();

    PokemonModel pokemon_model;
    EvolutionModel evolution_model;
    List<Pokemon> evolution_chain = [];

    for (int i = 0; i < pokemon_favorite.length; i++) {
      print(pokemon_favorite);
      pokemon_model = await Api.getPokemon(pokemon_favorite[i]);
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

    pageReady = true;
  }
  ////===RESULT_PAGE===////

  @override
  void dispose() {
    pokemonStream.close();
    super.dispose();
  }
}
