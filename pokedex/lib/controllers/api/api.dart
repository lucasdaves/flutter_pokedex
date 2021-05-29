import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokedex/models/evolution_model.dart';
import 'package:pokedex/models/list_pokemon.dart';
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

  static Future<ListPokemon> getPokemonList() async {
    var response =
        await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/"));
    if (response.statusCode == 200) {
      ListPokemon listPokemon =
          ListPokemon.fromJson(json.decode(response.body));

      return listPokemon;
    } else {
      throw Exception("Erro ao carregar pokémons");
    }
  }
}
