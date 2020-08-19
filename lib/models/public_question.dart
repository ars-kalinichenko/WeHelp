import 'package:we_help/models/public_user.dart';
import 'package:we_help/models/tag.dart';

class PublicQuestion {
  int id;
  String title;
  String content;
  PublicUser author;
  String pubDate;
  int views;
  List<Tag> tags;

  PublicQuestion(
      {this.id,
      this.title,
      this.content,
      this.author,
      this.pubDate,
      this.views,
      this.tags});

  factory PublicQuestion.fromJson(Map<String, dynamic> json) {
    List<Tag> listTags =
        json['tags'].map<Tag>((tag) => Tag.fromJson(tag)).toList();
    return PublicQuestion(
        id: json["id"] as int,
        title: json["name"] as String,
        content: json["description"] as String,
        author: PublicUser.fromJson(json["author"]),
        pubDate: json["pub_date"] as String,
        tags: listTags);
  }
}
