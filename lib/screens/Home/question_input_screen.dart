import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/icons.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/components/text_button.dart';
import 'package:we_help/screens/Home/question_detail_screen.dart';

class SearchInputScreen extends StatelessWidget {
  final String searchRequest;

  SearchInputScreen(this.searchRequest);

  Widget build(BuildContext context) {
    String _changedSearchRequest = searchRequest;
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWeight = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
          Container(
              padding: EdgeInsets.only(
                  top: sizeHeight * 0.11,
                  left: sizeWeight * 0.1,
                  right: sizeWeight * 0.1),
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(LogInIcons.eva_arrow_ios_back_fill),
                      iconSize: 40.0,
                      onPressed: () => Navigator.of(context).pop()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Text("Задать вопрос",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline2),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: sizeHeight * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Ваш вопрос"),
              StandardInputField(
                  color: Theme.of(context).primaryColor,
                  initText: searchRequest,
                  hintText: "Как приручить манула?",
                  onChanged: (value) {
                    _changedSearchRequest = value;
                  }),
              SizedBox(height: sizeHeight * 0.06),
              Text("Похожий вопрос уже обсуждался ",
                  style: Theme.of(context).textTheme.headline4),
              SizedBox(
                height: sizeHeight * 0.03,
              ),
              Text("Как воспитать котика? - 3 ответа"),
              SizedBox(
                height: sizeHeight * 0.03,
              ),
              Text("Как уничтожить мир? - 4 ответа"),
              SizedBox(
                height: sizeHeight * 0.03,
              ),
            ],
          ),
          SizedBox(height: sizeHeight * 0.04),
          TextButton(
            text: "Показать все",
            underline: true,
          ),
          SizedBox(height: sizeHeight * 0.07),
          RoundedButton(
              text: "Далее",
              color: Colors.transparent,
              textColor: Theme.of(context).accentColor,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchDetailScreen(_changedSearchRequest);
                }));
              }),
          SizedBox(height: sizeHeight * 0.07)
        ])));
  }
}
