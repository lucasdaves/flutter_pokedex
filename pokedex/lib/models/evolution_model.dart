import 'evolution_chain.dart';

class EvolutionModel {
  late String babyTriggerItem;
  late Chain chain;
  late int id;

  EvolutionModel(
      {required this.babyTriggerItem, required this.chain, required this.id});

  EvolutionModel.fromJson(Map<String, dynamic> json) {
    babyTriggerItem = json['baby_trigger_item'].toString();
    if (json['chain'] != null) {
      chain = new Chain.fromJson(json['chain']);
    }
    id = json['id'];
  }
}
