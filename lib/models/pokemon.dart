import 'evolution_model.dart';
import 'pokemon_model.dart';

class Pokemon {
  late PokemonModel pokemon_model;
  late EvolutionModel evolution_model;
  late List<Pokemon> evolution_chain;

  Pokemon({
    required this.pokemon_model,
    required this.evolution_model,
    required this.evolution_chain,
  });

  static Pokemon createPokemon(
      pokemon_model, evolution_model, pokemon_evolutions) {
    Pokemon pokemon = Pokemon(
      pokemon_model: pokemon_model,
      evolution_model: evolution_model,
      evolution_chain: pokemon_evolutions,
    );
    return pokemon;
  }
}
