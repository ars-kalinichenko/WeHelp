import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:we_help/components/search_field.dart';
import 'package:we_help/services/rest_api.dart';
import 'package:we_help/services/stabilizer.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  static bool _isQuestions = true;
  static bool _isPeople = false;
  static bool _isArticles = false;
  static String _searchRequest;
  final _stabilizer = Stabilizer(milliseconds: 500);

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
      hintText: "Что вы хотите найти?",
      width: 0.85,
      onChanged: (value) {
        _searchRequest = value;
      },
    );
  }

  void _searchByFilter() {
    if (_isPeople)
      RestApi.searchUsers(_searchRequest);
    else if (_isQuestions)
      RestApi.searchQuestions(_searchRequest);
    else
      RestApi.searchArticle(_searchRequest);
  }

  Widget _filterRow() {
    Color activeColor = Color(0xff0073FF);
    Color inactiveTextColor = Color(0xff60626D);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          color: _isQuestions ? activeColor : Colors.transparent,
          textColor: _isQuestions ? Colors.white : inactiveTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            side: BorderSide(color: Colors.blueAccent, width: 2),
          ),
          child: Text("Вопросы"),
          onPressed: () =>
              setState(() {
                _clearFilter();
                _isQuestions = !_isQuestions;
              },
              ),
        ),
        FlatButton(
          color: _isPeople ? activeColor : Colors.transparent,
          textColor: _isPeople ? Colors.white : inactiveTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            side: BorderSide(color: Colors.blueAccent, width: 2),
          ),
          child: Text("Люди"),
          onPressed: () =>
              setState(() {
                _clearFilter();
                _isPeople = !_isPeople;
              },
              ),
        ),
        FlatButton(
          color: _isArticles ? activeColor : Colors.transparent,
          textColor: _isArticles ? Colors.white : inactiveTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            side: BorderSide(color: Colors.blueAccent, width: 2),
          ),
          child: Text("Посты"),
          onPressed: () => setState(
            () {
              _clearFilter();
              _isArticles = !_isArticles;
            },
          ),
        ),

      ],
    );
  }

  void _clearFilter() {
    _isQuestions = false;
    _isArticles = false;
    _isPeople = false;
  }
}
