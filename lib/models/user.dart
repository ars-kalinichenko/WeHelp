import 'package:we_help/models/tag.dart';

class User {
  /// User of our app (full view after searching)
  int id;
  String name;
  String surname;
  String aboutMe;
  String educationDescription;
  String image;
  double rating;
  List<Tag> tags;

  User(
      {this.id,
      this.name,
      this.surname,
      this.aboutMe = "...",
      this.educationDescription = "...",
      this.image,
      this.rating,
      this.tags});

  factory User.fromJson(Map<String, dynamic> json) {
    //todo: remove
    List<Tag> listTags;
    try {
      listTags = json['tags'].map<Tag>((tag) => Tag.fromJson(tag)).toList();
    } catch (e) {
      listTags = [];
    }
    return User(
        id: json["id"] as int,
        name: json["name"] as String,
        surname: json["surname"] as String,
        rating: double.parse(json["rank"].toStringAsFixed(1)),
        tags: listTags);
  }
}
