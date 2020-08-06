import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/article_preview.dart';
import 'package:we_help/components/search_field.dart';
import 'package:we_help/models/tag.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWeight = MediaQuery.of(context).size.width;
    List<Widget> items = [
      ArticlePreview(
        author: "Евгений Моховский",
        title: "Что делать если на тебя напал дикий еж?",
        description: "В лесу встретил злого ежа. \nЧто делать?",
        tags: [Tag(id: 0, name: " #дикие животные ", color: "grey")],
        date: "24.07.2020",
        time: "23:46",
        answersCount: 11,
      ),
      ArticlePreview(
        author: "Марина Тарчинская",
        title: "Как приготовить настоящий узбекский плов?",
        description: "Плов хочу как в Узбекистане. \nКак такое готовить?",
        tags: [
          Tag(id: 0, name: " #кулинария ", color: "grey"),
          Tag(id: 1, name: " #еда ", color: "grey"),
          Tag(id: 0, name: " #национальная кухня ", color: "grey"),

        ],
        date: "24.07.2020",
        time: "23:46",
        answersCount: 11,
      )
    ];

    return Scaffold(
        body: ListView(
            padding: EdgeInsets.only(left: sizeWeight * 0.06),
            children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: sizeHeight * 0.03),
              Container(
                  height: sizeHeight * 0.17,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      //TODO: add tips
                    ],
                  )),
              SearchInputField(
                width: 0.87,
                hintText: "Ваш вопрос...",
              ),
              SizedBox(height: sizeHeight * 0.03),
              Text(
                "Актуальное для тебя",
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          SizedBox(
            height: sizeHeight * 0.03,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: items)
        ]));
  }
}
