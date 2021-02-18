import 'dart:convert';

List<Model> modelFromJson(String response) =>
    List<Model>.from(json.decode(response).map((item) => Model.fromJson(item)));

class Model {
  Model({
    this.id,
    this.title,
    this.createdAt,
  });

  int id;
  String title;
  DateTime createdAt;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["id"] as int,
        title: json["title"] as String,
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "createdAt": createdAt.toIso8601String(),
      };
}
