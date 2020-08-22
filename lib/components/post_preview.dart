import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:we_help/examples.dart';
import 'package:we_help/models/tag.dart';

class PostPreview extends StatelessWidget {
  /// Creates an article preview widget.
  /// Used in the home screen and search screen.
  final String title;
  final String description;
  final List<Tag> tags;
  final Function press;
  final String contentKey;

  const PostPreview({
    Key key,
    this.title,
    this.description,
    this.tags,
    this.press,
    this.contentKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Container mainContainer = Container(
      // The wrapper for the entire widget.
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      margin: EdgeInsets.only(
        bottom: size.height * 0.03,
      ),
      width: size.width * 0.9,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        color: RandomColor().randomColor(
          colorBrightness: ColorBrightness.light,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: childContainer(size),
    );
    return mainContainer;
  }

  Widget childContainer(Size size) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: size.width * 0.9,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleText(size.width, title),
          _descriptionText(description),
          _tagsRow(size, Examples().tagSamples),
        ],
      ),
    );
  }

  Widget _titleText(double screenWidth, String title) {
    return SizedBox(
      width: screenWidth * 0.7,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Color(0xff3F3D56),
        ),
      ),
    );
  }

  Widget _descriptionText(String description) {
    return Text(
      description,
      style: TextStyle(fontSize: 16, color: Colors.black),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget _tagsRow(Size size, List<Tag> tagList) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.038,
        minHeight: size.height * 0.02,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: buildTagWidgets(size.width, tagList),
      ),
    );
  }

  static List<Widget> buildTagWidgets(double screenWidth, List<Tag> tagList) {
    /// Returns a list of tag widgets with text, background and padding.
    return tagList
        .map(
          (tag) => Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            margin: EdgeInsets.only(right: screenWidth * 0.02),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffD3D6DA),
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            child: Text(
              tag.name,
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
        .toList();
  }
}
