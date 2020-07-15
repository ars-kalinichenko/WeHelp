import 'package:flutter/material.dart';
import 'package:we_help/constants.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: PrimaryColor,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartPage(title: 'Start Page'),
    );
  }
}

class StartPage extends StatefulWidget {
  StartPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                  child: Text('WeHelp',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 28.0, fontFamily: "Montserrat")),
                ),
                SizedBox(height: 50.0),
                Container(
                  child: Text('Решение есть',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 28.0, fontFamily: "Montserrat")),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 45.0, right: 45.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50.0,
                    child: Material(
                      borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(40.0)),
                      shadowColor: PrimaryColor,
                      color: PrimaryColor,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          print("Clicked!"); //TODO: swipe screen
                        },
                        child: Center(
                          child: Text(
                            'Мне нужна помощь',
                            style: TextStyle(
                                color: PrimaryColorLight,
                                fontSize: 18,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: PrimaryColor,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                              bottomRight: const Radius.circular(40.0))),
                      child: GestureDetector(
                        onTap: () {
                          print("Clicked2!"); //TODO: swipe screen
                        },
                        child: Center(
                          child: Text(
                            'Я могу помочь',
                            style: TextStyle(
                                color: PrimaryColorMainText,
                                fontSize: 18,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(height: 30),
          Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: GestureDetector(
                onTap: () {
                  print("Политика конфиденциальности");
                },
                child: Text(
                  'Политика конфиденциальности',
                  style: TextStyle(
                      color: PrimaryColor,
                      fontSize: 16,
                      fontFamily: 'Montserrat'),
                ),
              ))
        ])));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
