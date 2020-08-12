import 'package:flutter/material.dart';

import 'icons.dart';

Widget titleWithBackArrow(ThemeData theme, BuildContext context, String title) {
  return Row(
    children: <Widget>[
      IconButton(
          icon: Icon(LogInIcons.back_arrow_icon),
          iconSize: 24.0,
          onPressed: () => Navigator.of(context).pop()),
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
