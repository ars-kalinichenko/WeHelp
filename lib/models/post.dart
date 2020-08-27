import 'package:we_help/models/tag.dart';

class Post {
  /// User of our app (full view after searching)
  int id;
  String title;
  String description;
  double rating;
  List<Tag> tags;

  Post({this.id, this.title, this.description, this.rating, this.tags});

  factory Post.fromJson(Map<String, dynamic> json) {
    //todo: remove
    List<Tag> listTags;
    try {
      listTags = json['tags'].map<Tag>((tag) => Tag.fromJson(tag)).toList();
    } catch (e) {
      listTags = [];
    }
    return Post(
        id: json["id"] as int,
        title: json["title"] as String,
        description: json["content"] as String,
        rating: 4.8,
        tags: listTags);
  }
}
