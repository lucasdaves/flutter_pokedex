class Pokemon {
  String? pokemonName;
  String? pokemonType;
  String? pokemonImage;

  Pokemon({
    this.pokemonName,
    this.pokemonType,
    this.pokemonImage,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    pokemonName = json['pokemonName'];
    pokemonType = json['pokemonType'];
    pokemonImage = json['pokemonImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pokemonName'] = this.pokemonName;
    data['pokemonType'] = this.pokemonType;
    data['pokemonImage'] = this.pokemonImage;
    return data;
  }
}
