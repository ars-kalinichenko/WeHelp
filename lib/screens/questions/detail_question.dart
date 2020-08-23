import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:we_help/components/answer_preview.dart';
import 'package:we_help/components/icons.dart';
import 'package:we_help/components/question_preview.dart';
import 'package:we_help/components/text_button.dart';
import 'package:we_help/models/answer.dart';
import 'package:we_help/models/public_user.dart';
import 'package:we_help/models/question_detail.dart';
import 'package:we_help/screens/questions/answer_input.dart';
import 'package:we_help/services/rest_api.dart';

class QuestionDetailScreen extends StatefulWidget {
  final int contentId;
  final String title;
  final String description;
  final String authorName;
  final String authorSurname;

  QuestionDetailScreen({
    Key key,
    @required this.contentId,
    this.title,
    this.description,
    this.authorName,
    this.authorSurname,
  }) : super(key: key);

  createState() => new _QuestionDetailState(
    contentId: contentId,
        title: title,
        description: description,
        authorName: authorName,
        authorSurname: authorSurname,
      );
}

class _QuestionDetailState extends State<QuestionDetailScreen> {
  final int contentId;
  final String title;
  final String description;
  final String authorName;
  final String authorSurname;

  _QuestionDetailState({
    @required this.contentId,
    this.title,
    this.description,
    this.authorName,
    this.authorSurname,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<DetailQuestion>(
      future: RestApi.getQuestionDetail(contentId),
      builder: (BuildContext context, AsyncSnapshot<DetailQuestion> snapshot) {
        QuestionPreview questionWidget;
        List<Answer> answersList = [];
        List<AnswerPreview> answerWidgets = [];

        if (snapshot.hasData) {
          questionWidget = questionToPreview(snapshot.data);
          answersList = snapshot.data.answers;
        } else {
          //todo: to samples
          questionWidget = questionToPreview(
            DetailQuestion(
              id: contentId,
              author: PublicUser(name: authorName, surname: authorSurname),
              name: title,
              description: description,
              tags: [],
              answerCount: 0,
            ),
          );
        }
        answerWidgets = answersList
            .map((answer) => AnswerPreview.answerToPreview(answer))
            .toList();
        return Scaffold(
          body: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _header(context, screenHeight, screenWidth, questionWidget,
                      title),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  _answersList(answerWidgets),
                  _addAnswer(screenHeight, screenWidth),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _header(BuildContext context, double screenHeight, double screenWidth,
      Widget questionWidget, String title) {
    return Container(
      height: screenHeight * 0.47,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Color(0xff0073FF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.015,
          ),
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    LogInIcons.back_arrow_icon,
                    color: Colors.white,
                  ),
                  iconSize: 40.0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: _searchField(screenHeight, screenWidth, title),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          questionWidget,
        ],
      ),
    );
  }

  Widget _searchField(double screenHeight, double screenWidth, String text) {
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.09,
      alignment: Alignment.center,
      child: TextFormField(
        readOnly: true,
        textAlign: TextAlign.left,
        textCapitalization: TextCapitalization.sentences,
        style: Theme.of(context).textTheme.headline6,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff0073FF),
          ),
          hintText: text,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  static QuestionPreview questionToPreview(DetailQuestion question) {
    return QuestionPreview(
      authorName: question.author.name,
      authorSurname: question.author.surname,
      title: question.name,
      description: question.description,
      tags: question.tags,
      answersCount: question.answerCount,
    );
  }

  Widget _answersList(List<Widget> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: data,
    );
  }

  Widget _addAnswer(double screenHeight, double screenWidth) {
    return Container(
      // The wrapper for the entire widget.
      width: screenWidth * 0.9,
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(0xff9C9C9C),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        // Main column
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Знаете как помочь?",
            style: TextStyle(
              color: Color(0xff3F3D56),
              fontSize: 16,
            ),
          ),
          TextButton(
            text: "Добавить ответ",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AnswerInputScreen(
                      questionId: contentId,
                    );
                  },
                ),
              );
            },
            textStyle: TextStyle(
              color: Color(0xff3F3D56),
              fontSize: 16,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
