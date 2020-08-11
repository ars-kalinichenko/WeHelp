import 'package:we_help/models/public_user.dart';
import 'package:we_help/models/tag.dart';

class PublicQuestion {
  int id;
  String title;
  String minContent;
  PublicUser author;
  String pubDate;
  int views;
  List<Tag> tags;

  PublicQuestion(
      {this.id,
      this.title,
      this.minContent,
      this.author,
      this.pubDate,
      this.views,
      this.tags});

  factory PublicQuestion.fromJson(Map<String, dynamic> json) {
    List<Tag> listTags =
        json['tags']['example'].map<Tag>((tag) => Tag.fromJson(tag)).toList();
    return PublicQuestion(
        id: json["id"] as int,
        title: json["title"] as String,
        minContent: json["min_content"] as String,
        author: PublicUser.fromJson(json["author"]),
        pubDate: json["pub_date"] as String,
        views: json["views"] as int,
        tags: listTags);
  }
}
