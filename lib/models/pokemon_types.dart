import 'pokemon_ability.dart';

class Types {
  late int slot;
  late Ability type;

  Types({required this.slot, required this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = (json['type'] != null ? new Ability.fromJson(json['type']) : null)!;
  }
}
