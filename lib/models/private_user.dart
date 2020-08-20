import 'package:we_help/models/article.dart';
import 'package:we_help/models/review_request.dart';
import 'package:we_help/models/tag.dart';

class PrivateUser {
  int id;
  String name;
  String surname;
  String aboutMe;
  String educationDescription;
  List<Tag> tags;
  double rating;
  List<ReviewRequest> reviews;
  List<Article> articles;
  int answerCount;
  int questionCount;
  String image;
  String password;
  String email;
  String phone;

  PrivateUser({
    this.id,
    this.name,
    this.surname,
    this.aboutMe,
    this.educationDescription,
    this.tags,
    this.rating,
    this.reviews,
    this.articles,
    this.answerCount,
    this.questionCount,
    this.image,
    this.password,
    this.email,
    this.phone,
  });

  factory PrivateUser.fromJson(Map<String, dynamic> json) {
    List<Tag> listTags =
        json['tags'].map<Tag>((tag) => Tag.fromJson(tag)).toList();
    return PrivateUser(
      id: json["id"] as int,
      name: json["name"] as String,
      surname: json["surname"] as String,
      aboutMe: json["about_me"] as String,
      educationDescription: json["education_description"] as String,
      tags: listTags,
      rating: json["rating"] as double,
      reviews: [],
      articles: [],
      answerCount: json["answer_count"] as int,
      questionCount: json["question_count"] as int,
      image: "",
      password: "",
      email: "",
      phone: "",
    );
  }
}
