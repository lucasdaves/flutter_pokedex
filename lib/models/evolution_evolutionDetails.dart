import 'evolution_trigger.dart';

class EvolutionDetails {
  var gender;
  var heldItem;
  var item;
  var knownMove;
  var knownMoveType;
  var location;
  var minAffection;
  var minBeauty;
  var minHappiness;
  var minLevel;
  var needsOverworldRain;
  var partySpecies;
  var partyType;
  var relativePhysicalStats;
  var timeOfDay;
  var tradeSpecies;
  var trigger;
  var turnUpsideDown;

  EvolutionDetails(
      {this.gender,
      this.heldItem,
      this.item,
      this.knownMove,
      this.knownMoveType,
      this.location,
      this.minAffection,
      this.minBeauty,
      this.minHappiness,
      this.minLevel,
      this.needsOverworldRain,
      this.partySpecies,
      this.partyType,
      this.relativePhysicalStats,
      this.timeOfDay,
      this.tradeSpecies,
      this.trigger,
      this.turnUpsideDown});

  EvolutionDetails.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    heldItem = json['held_item'];
    item = json['item'];
    knownMove = json['known_move'];
    knownMoveType = json['known_move_type'];
    location = json['location'];
    minAffection = json['min_affection'];
    minBeauty = json['min_beauty'];
    minHappiness = json['min_happiness'];
    minLevel = json['min_level'];
    needsOverworldRain = json['needs_overworld_rain'];
    partySpecies = json['party_species'];
    partyType = json['party_type'];
    relativePhysicalStats = json['relative_physical_stats'];
    timeOfDay = json['time_of_day'];
    tradeSpecies = json['trade_species'];
    trigger =
        json['trigger'] != null ? new Trigger.fromJson(json['trigger']) : null;
    turnUpsideDown = json['turn_upside_down'];
  }
}
