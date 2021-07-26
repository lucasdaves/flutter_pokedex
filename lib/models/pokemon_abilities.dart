import 'pokemon_ability.dart';

class Abilities {
  late Ability ability;
  late bool isHidden;
  late int slot;

  Abilities(
      {required this.ability, required this.isHidden, required this.slot});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability = (json['ability'] != null
        ? new Ability.fromJson(json['ability'])
        : null)!;
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }
}
