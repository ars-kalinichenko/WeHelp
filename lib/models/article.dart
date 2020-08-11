import 'package:we_help/models/tag.dart';

class Article {
  int id;
  String title;
  String minContent;
  String pubDate;
  int views;
  List<Tag> tags;

  Article(
      {this.id,
      this.title,
      this.minContent,
      this.pubDate,
      this.views,
      this.tags});

  factory Article.fromJson(Map<String, dynamic> json) {
    List<Tag> listTags =
        json['tags']['example'].map<Tag>((tag) => Tag.fromJson(tag)).toList();
    return Article(
        id: json["id"] as int,
        title: json["title"] as String,
        minContent: json["min_content"] as String,
        pubDate: json["pub_date"] as String,
        views: json["views"] as int,
        tags: listTags);
  }
}
