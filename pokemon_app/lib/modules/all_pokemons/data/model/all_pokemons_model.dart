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
      results = <AllPokemonsItemModel>[];
      json['results'].forEach((v) {
        results!.add(AllPokemonsItemModel.fromJson(v));
      });
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
