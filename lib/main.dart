import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_help/screens/main_page.dart';
import 'package:we_help/screens/registration/registration.dart';
import 'package:we_help/screens/welcome/welcome_screen.dart';

import 'components/behavior_elements.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(WeHelp());
}

class WeHelp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => RegistrationState(),
      child: MaterialApp(
          title: 'WeHelp',
          theme: appLightTheme,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: PagingBehavior(),
              child: child,
            );
          },
          home: MainPage()),
    );
  }
}
