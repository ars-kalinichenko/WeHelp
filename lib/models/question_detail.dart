import 'package:we_help/models/answer.dart';
import 'package:we_help/models/public_user.dart';
import 'package:we_help/models/tag.dart';

class DetailQuestion {
  int id;
  String name;
  String description;
  PublicUser author;
  List<Tag> tags;
  String pubDate;
  List<Answer> answers;
  int answerCount;

  DetailQuestion(
      {this.id,
      this.name,
      this.description,
      this.author,
      this.pubDate,
      this.answerCount,
      this.answers,
      this.tags});

  factory DetailQuestion.fromJson(Map<String, dynamic> json) {
    List<Tag> listTags =
        json['tags'].map<Tag>((tag) => Tag.fromJson(tag)).toList();
    List<Answer> listAnswers = json['answers']
        .map<Answer>((answer) => Answer.fromJson(answer))
        .toList();
    return DetailQuestion(
        id: json["id"] as int,
        name: json["name"] as String,
        description: json["description"] as String,
        author: PublicUser.fromJson(json["author"]),
        pubDate: json["pub_date"] as String,
        answerCount: json["answer_count"] as int,
        answers: listAnswers,
        tags: listTags);
  }
}
