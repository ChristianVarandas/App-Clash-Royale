class Cards {
  String? name;
  int? id;
  int? maxLevel;
  int? maxEvolutionLevel;
  int? elixirCost;
  IconUrls? iconUrls;
  String? rarity;

  Cards(
      {this.name,
      this.id,
      this.maxLevel,
      this.maxEvolutionLevel,
      this.elixirCost,
      this.iconUrls,
      this.rarity});

  Cards.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    maxLevel = json['maxLevel'];
    maxEvolutionLevel = json['maxEvolutionLevel'];
    elixirCost = json['elixirCost'];
    iconUrls = json['iconUrls'] != null
        ? new IconUrls.fromJson(json['iconUrls'])
        : null;
    rarity = json['rarity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['maxLevel'] = this.maxLevel;
    data['maxEvolutionLevel'] = this.maxEvolutionLevel;
    data['elixirCost'] = this.elixirCost;
    if (this.iconUrls != null) {
      data['iconUrls'] = this.iconUrls!.toJson();
    }
    data['rarity'] = this.rarity;
    return data;
  }
}

class IconUrls {
  String? medium;
  String? heroMedium;
  String? evolutionMedium;

  IconUrls({this.medium, this.heroMedium, this.evolutionMedium});

  IconUrls.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    heroMedium = json['heroMedium'];
    evolutionMedium = json['evolutionMedium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    data['heroMedium'] = this.heroMedium;
    data['evolutionMedium'] = this.evolutionMedium;
    return data;
  }
}
