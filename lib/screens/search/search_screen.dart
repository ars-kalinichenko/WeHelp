
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:we_help/components/search_field.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  static bool _isPeople = true;
  static bool _isQuestions = true;
  static bool _isArticles = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: size.height * 0.03),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _searchInputField(),
                _filterRow(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchInputField() {
    return SearchInputField(
      hintText: "Мы многое сможем найти",
      width: 0.85,
    );
  }

  Widget _filterRow() {
    Color activeColor = Color(0xff0073FF);
    Color inactiveTextColor = Color(0xff3F3D56);
    // todo: refactor this trash!
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          color: _isPeople ? activeColor : Colors.transparent,
          textColor: _isPeople ? Colors.white : inactiveTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            side: BorderSide(color: Colors.blueAccent, width: 2),
          ),
          child: Text("Люди"),
          onPressed: () => setState(() => _isPeople = !_isPeople),
        ),
        FlatButton(
          color: _isArticles ? activeColor : Colors.transparent,
          textColor: _isArticles ? Colors.white : inactiveTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            side: BorderSide(color: Colors.blueAccent, width: 2),
          ),
          child: Text("Статьи"),
          onPressed: () => setState(() => _isArticles = !_isArticles),
        ),
        FlatButton(
          color: _isQuestions ? activeColor : Colors.transparent,
          textColor: _isQuestions ? Colors.white : inactiveTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            side: BorderSide(color: Colors.blueAccent, width: 2),
          ),
          child: Text("Вопросы"),
          onPressed: () => setState(() => _isQuestions = !_isQuestions),
        ),
      ],
    );
  }
}
