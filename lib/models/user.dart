import 'package:we_help/models/reviewRequest.dart';
import 'package:we_help/models/tag.dart';

class User {
  /// User of our app (full view after searching)
  int id;
  String name;
  String surname;
  String aboutMe;
  String educationDescription;
  String image;
  int rating;
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
    return User(
        id: json["id"] as int,
        name: json["name"] as String,
        surname: json["surname"] as String,
        aboutMe: json["about_me"] as String,
        educationDescription: json["education_description"] as String,
        image: json["image"] as String,
        rating: json["rating"] as int,
        reviews: json["reviews"] as List<ReviewRequest>,
        tags: json["tags"] as List<Tag>);
  }
}
