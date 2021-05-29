import 'pokemon_ability.dart';

class Moves {
  late Ability move;

  Moves({required this.move});

  Moves.fromJson(Map<String, dynamic> json) {
    move = (json['move'] != null ? new Ability.fromJson(json['move']) : null)!;
  }
}
