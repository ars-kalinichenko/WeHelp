import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:we_help/models/answer.dart';

class AnswerPreview extends StatelessWidget {
  /// Creates an question preview widget.
  /// Used in the home screen and search screen.
  final int id;
  final String authorName;
  final String authorSurname;
  final String text;
  final String pubDate;
  final int likes;
  final bool isSolution;

  const AnswerPreview({
    Key key,
    this.id,
    this.authorName,
    this.authorSurname,
    this.text,
    this.pubDate,
    this.likes,
    this.isSolution,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);

    return Container(
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _authorDetailWithDate(
              themeData, size, authorName, authorSurname, pubDate),
          _answerText(text),
          _statistic(likes, isSolution),
        ],
      ),
    );
  }

  Widget _authorDetailWithDate(ThemeData theme, Size size, String authorName,
      String authorSurname, String pubDate) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: RandomColor().randomColor(
            colorBrightness: ColorBrightness.light,
          ),
          foregroundColor: Colors.black,
          radius: size.height * 0.028,
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$authorName $authorSurname",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headline5,
            ),
            Text(
              pubDate,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _answerText(String text) {
    return Text(
      text,
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Color(0xff0D0D0D),
        fontSize: 14,
      ),
    );
  }

  Widget _statistic(int likes, bool isSolution) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$likes лайков",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        Text(
          isSolution.toString(),
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff3F3D56),
          ),
        ),
      ],
    );
  }

  static AnswerPreview answerToPreview(Answer answer) {
    return AnswerPreview(
      id: answer.id,
      authorName: answer.author.name,
      authorSurname: answer.author.surname,
      text: answer.text,
      pubDate: answer.pubDate,
      isSolution: answer.isSolution,
      likes: answer.rating,
    );
  }
}
