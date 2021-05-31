class Trigger {
  late String name;
  late String url;

  Trigger({required this.name, required this.url});

  Trigger.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
