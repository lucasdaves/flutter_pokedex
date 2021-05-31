import 'evolution_model.dart';
import 'pokemon_model.dart';

class Pokemon {
  late PokemonModel pokemon_model;
  late EvolutionModel evolution_model;
  late List<Pokemon> pokemon_evolutions;

  Pokemon({
    required this.pokemon_model,
    required this.evolution_model,
    required this.pokemon_evolutions,
  });

  static Pokemon createPokemon(
      pokemon_model, evolution_model, pokemon_evolutions) {
    Pokemon pokemon = Pokemon(
      pokemon_model: pokemon_model,
      evolution_model: evolution_model,
      pokemon_evolutions: pokemon_evolutions,
    );
    return pokemon;
  }
}
