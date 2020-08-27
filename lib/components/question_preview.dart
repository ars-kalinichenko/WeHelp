import 'package:flutter/material.dart';
import 'package:we_help/models/tag.dart';
import 'package:we_help/screens/questions/detail_question.dart';

class QuestionPreview extends StatelessWidget {
  /// Creates an question preview widget.
  /// Used in the home screen and search screen.
  final String authorName;
  final String authorSurname;
  final String title;
  final String description;
  final List<Tag> tags;
  final int answersCount;
  final bool clickable;
  final int id;

  const QuestionPreview({
    Key key,
    this.authorName,
    this.authorSurname,
    this.title,
    this.description,
    this.tags,
    this.answersCount,
    this.clickable = false,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void toDetailScreen() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return QuestionDetailScreen(
              contentId: id,
              title: title,
              description: description,
              authorName: authorName,
              authorSurname: authorSurname,
            );
          },
        ),
      );
    }

    return InkWell(
        onTap: clickable
            ? () {
                toDetailScreen();
              }
            : () {},
        child: Container(
          // The wrapper for the entire widget.
          padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
          ),
          margin: EdgeInsets.only(
            bottom: size.height * 0.03,
          ),
          width: size.width * 0.9,
          height: size.height * 0.3,
          decoration: BoxDecoration(
            color: Colors.white,
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

          child: Column(
            // Main column
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _authorText(authorName, authorSurname),
              _titleText(title),
              _descriptionText(description),
              _tagsRow(size, tags),
              _statisticText(answersCount, " "),
            ],
          ),
        ));
  }

  Widget _authorText(String name, String surname) {
    return Text(
      "$surname $name",
      style: TextStyle(fontSize: 16, color: Color(0xff3F3D56)),
    );
  }

  Widget _titleText(String title) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Color(0xff3F3D56),
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

  Widget _statisticText(int answersCount, String viewsCount) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$answersCount ответов",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        Text(
          viewsCount,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff3F3D56),
          ),
        ),
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
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
        .toList();
  }
}
