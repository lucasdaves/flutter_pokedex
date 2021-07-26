import 'pokemon_abilities.dart';
import 'pokemon_ability.dart';
import 'pokemon_moves.dart';
import 'pokemon_sprites.dart';
import 'pokemon_stats.dart';
import 'pokemon_types.dart';

class PokemonModel {
  late String name;
  late List<Types> types;
  late List<Stats> stats;
  late List<Abilities> abilities;
  late List<Moves> moves;
  late Ability species;
  late Sprites sprites;
  late int weight;
  late int id;

  PokemonModel({
    required this.name,
    required this.types,
    required this.stats,
    required this.abilities,
    required this.moves,
    required this.species,
    required this.sprites,
    required this.weight,
    required this.id,
  });

  PokemonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];

    weight = json['weight'];

    id = json['id'];

    sprites = (json['sprites'] != null
        ? new Sprites.fromJson(json['sprites'])
        : null)!;

    species = (json['species'] != null
        ? new Ability.fromJson(json['species'])
        : null)!;

    if (json['abilities'] != null) {
      abilities = [];
      json['abilities'].forEach((v) {
        abilities.add(new Abilities.fromJson(v));
      });
    }

    if (json['types'] != null) {
      types = [];
      json['types'].forEach((v) {
        types.add(new Types.fromJson(v));
      });
    }

    if (json['stats'] != null) {
      stats = [];
      json['stats'].forEach((v) {
        stats.add(new Stats.fromJson(v));
      });
    }

    if (json['moves'] != null) {
      moves = [];
      json['moves'].forEach((v) {
        moves.add(new Moves.fromJson(v));
      });
    }
  }
}
