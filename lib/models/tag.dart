class Tag {
  int id;
  String name;
  String color;

  Tag({this.id, this.name, this.color});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
        id: json["id"] as int,
        name: json["name"] as String,
        color: json["color"] as String);
  }
}
