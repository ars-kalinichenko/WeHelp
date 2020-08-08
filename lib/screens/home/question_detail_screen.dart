import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/custom_toast.dart';
import 'package:we_help/components/icons.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/exceptions.dart';
import 'package:we_help/screens/main_page.dart';
import 'package:we_help/services/rest_api.dart';

class SearchDetailScreen extends StatelessWidget {
  final String searchRequest;

  SearchDetailScreen(this.searchRequest);

  static void pushQuestion(
      BuildContext context, Map<String, dynamic> data) async {
    try {
      await RestApi.postQuestion(data);
      ToastUtils.showCustomToast(
          context,
          "Вопрос отправлен!",
          Icon(Icons.check, color: Colors.white),
          Colors.white,
          Color(0xff3EE896));
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return MainPage();
      }), (Route<dynamic> route) => false);
    } on InternetError catch (e) {
      ToastUtils.showCustomToast(
          context,
          "Проверьте данные и интеренет",
          Icon(Icons.clear, color: Colors.white),
          Colors.white,
          Color(0xffF14E4E));
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    String _changedSearchRequest = searchRequest;
    String _detail;
    String _tags;

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
            height: sizeHeight * 0.08,
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
                  },
                ),
                SizedBox(
                  height: sizeHeight * 0.02,
                ),
                Text("Расскажите подробнее"),
                StandardInputField(
                    color: Theme.of(context).primaryColor,
                    hintText: "Пытаюсь усмирить милого демона",
                    onChanged: (value) {
                      _detail = value;
                    }),
                SizedBox(
                  height: sizeHeight * 0.02,
                ),
                Text("Введите теги"),
                StandardInputField(
                    color: Theme.of(context).primaryColor,
                    hintText: "Котики, демоны",
                    onChanged: (value) {
                      _tags = value;
                    }),
                SizedBox(height: sizeHeight * 0.15),
                RoundedButton(
                    text: "Далее",
                    color: Colors.transparent,
                    textColor: Theme.of(context).accentColor,
                    press: () {
                      pushQuestion(context, {
                        "title": _changedSearchRequest,
                        "content": _detail,
                        "author_id": "1",
                        "pub_date": DateTime.now().toString(),
                        "tags": _tags
                      });
                    }),
                SizedBox(height: sizeHeight * 0.07)
              ])
        ])));
  }
}
