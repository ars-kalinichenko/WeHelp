import 'package:we_help/models/tag.dart';

class PublicTag {
  String type;
  List<Tag> example;

  PublicTag({this.type, this.example});

  factory PublicTag.fromJson(Map<String, dynamic> json) {
    return PublicTag(
      type: json["type"] as String,
      example: json['example'] as List<Tag>,
    );
  }
}
