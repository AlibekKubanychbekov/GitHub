class AllPokemonsEntity {
  int? count;
  String? next;
  String? previous;
  List<AllPokemonsItemEntity>? results;

  AllPokemonsEntity(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});
}

class AllPokemonsItemEntity {
  String? name;
  String? url;

  AllPokemonsItemEntity({required this.name, required this.url});
}
