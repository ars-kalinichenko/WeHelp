import 'package:we_help/models/public_user.dart';

class Answer {
  int id;
  String text;
  int rating;
  bool isSolution;
  PublicUser author;
  String pubDate;
  int question;

  Answer({
    this.id,
    this.text,
    this.rating,
    this.isSolution,
    this.author,
    this.pubDate,
    this.question,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json["id"] as int,
      text: json["text"] as String,
      rating: json["rating"] as int,
      isSolution: json["is_solution"] as bool,
      author: PublicUser.fromJson(json["author"]),
      pubDate: json["pub_date"] as String,
      question: json["question"] as int,
    );
  }
}
