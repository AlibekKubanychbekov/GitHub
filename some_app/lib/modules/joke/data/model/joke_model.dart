class JokeModel {
  String? id;
  String? joke;
  int? status;

  JokeModel({this.id, this.joke, this.status});

  JokeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    joke = json['joke'];
    status = json['status'];
  }
}
