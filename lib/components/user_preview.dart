import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:we_help/models/tag.dart';

class UserPreview extends StatelessWidget {
  /// Creates an article preview widget.
  /// Used in the home screen and search screen.
  final String name;
  final String surname;
  final double rating;
  final String photo;
  final String description;
  final List<Tag> tags;
  final Function press;
  final String contentKey;

  const UserPreview({
    Key key,
    this.name,
    this.surname,
    this.rating,
    this.photo,
    this.description,
    this.tags,
    this.press,
    this.contentKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Container container = Container(
      // The wrapper for the entire widget.
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      margin: EdgeInsets.only(
        bottom: size.height * 0.03,
      ),
      width: size.width * 0.90,
      height: size.height * 0.13,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Color(0xff0073FF),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Row(
        // Main column
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _photoAndRating(photo, rating, size.height),
          SizedBox(
            width: size.width * 0.04,
          ),
          _userInfo(size),
        ],
      ),
    );
    return container;
  }

  Widget _userInfo(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _userName(name, surname),
        SizedBox(
          height: size.height * 0.003,
        ),
        _descriptionText(description, size.width),
        SizedBox(
          height: size.height * 0.01,
        ),
        SizedBox(
          width: size.width * 0.6,
          child: _tagsRow(size, tags),
        ),
      ],
    );
  }

  Widget _userName(String name, String surname) {
    return Text(
      "$surname $name",
      style: TextStyle(fontSize: 18, color: Color(0xff0D0D0D)),
      overflow: TextOverflow.fade,
    );
  }

  Widget _descriptionText(String description, double screenWidth) {
    return ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: screenWidth * 0.4, maxWidth: screenWidth * 0.6),
        child: Text(
          description,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff0D0D0D),
          ),
        ));
  }

  Widget _tagsRow(Size size, List<Tag> tagList) {
    return SizedBox(
      height: size.height * 0.025,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: buildTagWidgets(size.width, tagList),
      ),
    );
  }

  Widget _photoAndRating(String photo, double rating, double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: RandomColor().randomColor(
            colorBrightness: ColorBrightness.light,
          ),
          foregroundColor: Colors.black,
          radius: screenHeight * 0.028,
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Text(
              rating.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            )
          ],
        )
      ],
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
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
        )
        .toList();
  }
}
