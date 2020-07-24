import 'package:flutter/material.dart';
import 'package:we_help/Screens/Welcome/welcome_screen.dart';

import 'Themes/app_theme.dart';
import 'components/behavior_elements.dart';

void main() {
  runApp(WeHelp());
}

class WeHelp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(appLightTheme.textTheme);
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
