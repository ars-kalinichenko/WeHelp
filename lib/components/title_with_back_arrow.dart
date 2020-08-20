import 'package:flutter/material.dart';

import 'icons.dart';
// todo: to class. set onPress default

Widget titleWithBackArrow(
    ThemeData theme, BuildContext context, String title, onPress) {
  return Row(
    children: <Widget>[
      IconButton(
          icon: Icon(LogInIcons.back_arrow_icon),
          iconSize: 24.0,
          onPressed: onPress),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headline2,
          ),
        ),
      ),
    ],
  );
}
