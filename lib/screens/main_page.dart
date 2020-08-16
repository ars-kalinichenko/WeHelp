import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/bottom_navbar.dart';
import 'package:we_help/screens/home/home_screen.dart';
import 'package:we_help/screens/messages/dialogs_screen.dart';
import 'package:we_help/screens/profile/profile_screen.dart';
import 'package:we_help/screens/search/search_screen.dart';

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
            SearchScreen(),
            MessagesScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: _customNavigationBar(),
    );
  }

  Widget _customNavigationBar() {
    return BottomNavBar(
      containerHeight: 60,
      selectedIndex: _currentIndex,
      onItemSelected: (index) {
        setState(() => _currentIndex = index);
        _pageController.jumpToPage(index);
      },
      items: [
        BottomNavBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
        BottomNavBarItem(
          icon: Icon(Icons.chat),
          title: Text('Messages'),
        ),
        BottomNavBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ],
    );
  }
}
