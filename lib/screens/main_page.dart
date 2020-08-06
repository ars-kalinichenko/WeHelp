import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/screens/Home/home_screen.dart';

class MainPage extends StatefulWidget {
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
              child: Text("2"),
            ),
            Center(
              child: Text("3"),
            ),
            Center(
              child: Text("4"),
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
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Color(0xff0574E5),
              textColor: Colors.white,
              inactiveColor: Color(0xff60626D)),
          BottomNavyBarItem(
              icon: Icon(Icons.notifications_none),
              title: Text('Users'),
              activeColor: Color(0xff0574E5),
              textColor: Colors.white,
              inactiveColor: Color(0xff60626D)),
          BottomNavyBarItem(
              icon: Icon(Icons.chat),
              title: Text('Messages'),
              activeColor: Color(0xff0574E5),
              textColor: Colors.white,
              inactiveColor: Color(0xff60626D)),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Settings'),
              activeColor: Color(0xff0574E5),
              textColor: Colors.white,
              inactiveColor: Color(0xff60626D)),
        ],
      ),
    );
  }
}
