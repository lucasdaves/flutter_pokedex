import 'evolution_model.dart';
import 'pokemon_model.dart';

class Pokemon {
  late PokemonModel pokemon_model;
  late EvolutionModel evolution_model;

  Pokemon({
    required this.pokemon_model,
    required this.evolution_model,
  });

  static Pokemon createPokemon(pokemon_model, evolution_model) {
    Pokemon pokemon = Pokemon(
      pokemon_model: pokemon_model,
      evolution_model: evolution_model,
    );
    return pokemon;
  }
}
