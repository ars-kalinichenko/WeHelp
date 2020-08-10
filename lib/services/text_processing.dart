import 'package:we_help/models/tag.dart';

String deleteMask(Pattern format, String maskedString) =>
    maskedString.replaceAll(format, "");

List<Tag> splitTags(String text) {
  List<String> listNames = text.toLowerCase().split(",");
  List<Tag> listTags = listNames
      .map((tagName) => Tag(id: 1, name: tagName.trim(), color: "grey"))
      .toList();
  return listTags;
}
