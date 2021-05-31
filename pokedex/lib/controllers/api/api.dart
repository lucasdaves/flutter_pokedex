import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokedex/models/evolution_model.dart';
import 'package:pokedex/models/list_pokemon.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_model.dart';

class Api {
  static Future<PokemonModel> getPokemon(String search) async {
    var response =
        await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$search"));
    if (response.statusCode == 200) {
      PokemonModel pokemon = PokemonModel.fromJson(json.decode(response.body));

      return pokemon;
    } else {
      throw Exception("Erro ao carregar pokémons");
    }
  }

  static Future<EvolutionModel> getEvolution(String search) async {
    var response = await http.get(Uri.parse("$search"));

    String urlEvolutionChain =
        json.decode(response.body)["evolution_chain"]["url"];

    if (response.statusCode == 200) {
      response = await http.get(Uri.parse(urlEvolutionChain));

      EvolutionModel evolution =
          EvolutionModel.fromJson(json.decode(response.body));

      return evolution;
    } else {
      throw Exception("Erro ao carregar evolução");
    }
  }

  static Future<ListPokemon> getPokemonList(String search) async {
    var response =
        await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$search"));
    if (response.statusCode == 200) {
      ListPokemon listPokemon =
          ListPokemon.fromJson(json.decode(response.body));

      return listPokemon;
    } else {
      throw Exception("Erro ao carregar pokémons");
    }
  }

  static Future<List<Pokemon>> getChain(EvolutionModel object) async {
    List<Pokemon> chain = [];

    PokemonModel pokemon_model;
    EvolutionModel evolution_model;
    List<Pokemon> evolution_chain = [];

    for (var evolution1 in object.chain.evolvesTo) {
      for (var evolution2 in evolution1.evolvesTo) {
        pokemon_model = await Api.getPokemon(evolution2.species.name);
        evolution_model = await Api.getEvolution(pokemon_model.species.url);

        chain.add(Pokemon.createPokemon(
            pokemon_model, evolution_model, evolution_chain));
      }
      pokemon_model = await Api.getPokemon(evolution1.species.name);
      evolution_model = await Api.getEvolution(pokemon_model.species.url);

      chain.add(Pokemon.createPokemon(
          pokemon_model, evolution_model, evolution_chain));
    }

    pokemon_model = await Api.getPokemon(object.chain.species.name);
    evolution_model = await Api.getEvolution(pokemon_model.species.url);

    chain.add(
        Pokemon.createPokemon(pokemon_model, evolution_model, evolution_chain));

    return chain;
  }
}
