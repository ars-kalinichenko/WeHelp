import 'package:we_help/models/review_request.dart';
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
  List<ReviewRequest> reviews;
  List<Tag> tags;

  User(
      {this.id,
      this.name,
      this.surname,
      this.aboutMe,
      this.educationDescription,
      this.image,
      this.rating,
      this.reviews,
      this.tags});

  factory User.fromJson(Map<String, dynamic> json) {
    List<Tag> listTags =
        json['tags'].map<Tag>((tag) => Tag.fromJson(tag)).toList();
    return User(
        id: json["id"] as int,
        name: json["name"] as String,
        surname: json["surname"] as String,
        aboutMe:
            "Рандомный длинный текст, который должен прятаться после двух строк.",
//        educationDescription: json["education_description"] as String,
        image: json["image"] as String,
        rating: 4.8,
//        reviews: json["reviews"] as List<ReviewRequest>,
        tags: listTags);
  }
}
