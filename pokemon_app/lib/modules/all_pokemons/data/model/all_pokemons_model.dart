class AllPokemonsModel {
  int? count;
  String? next;
  String? previous;
  List<AllPokemonsItemModel>? results;

  AllPokemonsModel({this.count, this.next, this.previous, this.results});

  AllPokemonsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = (json['results'] as List<dynamic>).map((e) {
        return AllPokemonsItemModel.fromJson(e);
      }).toList();
    }
  }
}

class AllPokemonsItemModel {
  String? name;
  String? url;

  AllPokemonsItemModel({this.name, this.url});

  AllPokemonsItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
