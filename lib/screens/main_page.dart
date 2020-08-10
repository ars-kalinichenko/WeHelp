import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/bottom_navbar.dart';
import 'package:we_help/screens/home/home_screen.dart';

class MainPage extends StatefulWidget {
  /// Application home screen. The user goes to it after authentication.
  /// Designed to have a dock and swipe screens.
  @override
  createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomeScreen(),
            Center(
              child: Text("Тут юзеры"),
            ),
            Center(
              child: Text("Тут сообщения"),
            ),
            Center(
              child: Text("Тут настройки"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 60,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: [
          //TODO: ...
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            textColor: Colors.white,
            inactiveColor: Color(0xff60626D),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users'),
            textColor: Colors.white,
            inactiveColor: Color(0xff60626D),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.chat),
            title: Text('Messages'),
            textColor: Colors.white,
            inactiveColor: Color(0xff60626D),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            textColor: Colors.white,
            inactiveColor: Color(0xff60626D),
          ),
        ],
      ),
    );
  }
}