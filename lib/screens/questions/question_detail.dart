import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:we_help/components/answer_preview.dart';
import 'package:we_help/components/icons.dart';
import 'package:we_help/components/question_preview.dart';
import 'package:we_help/models/answer.dart';
import 'package:we_help/models/public_question.dart';
import 'package:we_help/models/public_user.dart';
import 'package:we_help/services/rest_api.dart';

class QuestionDetailScreen extends StatefulWidget {
  final int contentId;
  final String title;
  final String description;

  QuestionDetailScreen({
    Key key,
    @required this.contentId,
    this.title,
    this.description,
  }) : super(key: key);

  createState() => new _QuestionDetailState(
        contentId: contentId,
        title: title,
        description: description,
      );
}

class _QuestionDetailState extends State<QuestionDetailScreen> {
  final int contentId;
  final String title;
  final String description;

  _QuestionDetailState({
    @required this.contentId,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<PublicQuestion>(
      future: RestApi.getQuestionDetail(contentId),
      builder: (BuildContext context, AsyncSnapshot<PublicQuestion> snapshot) {
        QuestionPreview questionWidget;
        List<Answer> answersList = [
          Answer(
            id: 1,
            text:
                "I/flutter ( 5140): {id: 2, name: koko, description: koko, author: {id: 1, name: Ars, surname: Ars}, tags: [{id: 2, name: Arriva, color: black}], pub_date: 2020-08-22, answers: [], answer_count: 0}",
            rating: 10,
            isSolution: true,
            author: PublicUser(name: "Человек", surname: "Пчеловек"),
            pubDate: "сегодня",
            question: 1,
          )
        ];
        List<AnswerPreview> answerWidgets = [];

        if (snapshot.hasData) {
          questionWidget = questionToPreview(snapshot.data);
        } else {
          //todo: to samples

          questionWidget = questionToPreview(
            PublicQuestion(
              id: contentId,
              author: PublicUser(name: "", surname: ""),
              title: title,
              content: description,
              tags: [],
            ),
          );
        }
        answerWidgets = answersList
            .map((answer) => AnswerPreview.answerToPreview(answer))
            .toList();
        print(answerWidgets.length);
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
          SizedBox(
            height: screenHeight * 0.01,
          ),
          questionWidget
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

  static QuestionPreview questionToPreview(PublicQuestion question) {
    return QuestionPreview(
      authorName: question.author.name,
      authorSurname: question.author.surname,
      title: question.title,
      description: question.content,
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
}
