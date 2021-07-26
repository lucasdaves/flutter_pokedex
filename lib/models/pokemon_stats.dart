import 'pokemon_ability.dart';

class Stats {
  late int baseStat;
  late int effort;
  late Ability stat;

  Stats({required this.baseStat, required this.effort, required this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = (json['stat'] != null ? new Ability.fromJson(json['stat']) : null)!;
  }
}
