import 'package:flutter/material.dart';
import 'package:we_help/screens/Welcome/welcome_screen.dart';

import 'components/behavior_elements.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(WeHelp());
}

class WeHelp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WeHelp',
        debugShowCheckedModeBanner: false,
        theme: appLightTheme,
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: PagingBehavior(),
            child: child,
          );
        },
        home: WelcomeScreen());
  }
}
