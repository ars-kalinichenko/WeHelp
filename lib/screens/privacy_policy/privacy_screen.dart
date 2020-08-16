import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:we_help/behaviors/behavior_elements.dart';

PrivacyState pageState;

class PrivacyScreen extends StatefulWidget {
  @override
  PrivacyState createState() {
    pageState = PrivacyState();
    return pageState;
  }
}

class PrivacyState extends State<PrivacyScreen> {
  String filePath = "assets/privacy_policy.txt";
  String privacyText = "";

  readText(filePath) async {
    /// Function for reading text from a file and writing to a mutable widget.

    String text = await rootBundle.loadString(filePath);
    log("The privacy text was received.");
    setState(() {
      privacyText = text;
    });
  }

  @override
  void initState() {
    super.initState();
    // When the screen is created, the text read function is called.
    readText(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  left: 10, top: 30, right: 15, bottom: 15),
              child: Center(
                child: ScrollConfiguration(
                  behavior: PagingBehavior(),
                  child: SingleChildScrollView(
                    child: Text(privacyText,
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
