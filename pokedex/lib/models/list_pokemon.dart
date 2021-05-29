class ListPokemon {
  late int count;
  late String next;
  late Null previous;
  late List<Results> results;

  ListPokemon({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  ListPokemon.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      List<Results> results = [];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }
}

class Results {
  late String name;
  late String url;

  Results({
    required this.name,
    required this.url,
  });

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
