import 'evolution_evolutionDetails.dart';
import 'evolution_trigger.dart';

class EvolvesTo {
  late List<EvolutionDetails> evolutionDetails;
  late List<EvolvesTo> evolvesTo;
  late bool isBaby;
  late Trigger species;

  EvolvesTo(
      {required this.evolutionDetails,
      required this.evolvesTo,
      required this.isBaby,
      required this.species});

  EvolvesTo.fromJson(Map<String, dynamic> json) {
    if (json['evolution_details'] != null) {
      evolutionDetails = [];
      json['evolution_details'].forEach((v) {
        evolutionDetails.add(new EvolutionDetails.fromJson(v));
      });
    }
    if (json['evolves_to'] != null) {
      evolvesTo = [];
      json['evolves_to'].forEach((v) {
        evolvesTo.add(new EvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
    species = (json['species'] != null
        ? new Trigger.fromJson(json['species'])
        : null)!;
  }
}
