import 'evolution_chain.dart';

class EvolutionModel {
  String? babyTriggerItem;
  Chain? chain;
  int? id;

  EvolutionModel({this.babyTriggerItem, this.chain, this.id});

  EvolutionModel.fromJson(Map<String, dynamic> json) {
    babyTriggerItem = json['baby_trigger_item'];
    chain = json['chain'] != null ? new Chain.fromJson(json['chain']) : null;
    id = json['id'];
  }
}
