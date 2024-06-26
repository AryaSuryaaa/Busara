import 'dart:io';

import 'package:busara/common/styles.dart';
import 'package:busara/ui/ai_page.dart';
import 'package:busara/ui/article_page.dart';
import 'package:busara/ui/explore_page.dart';
import 'package:busara/ui/home_page.dart';
import 'package:busara/ui/profile_page.dart';
import 'package:busara/widget/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/home_page';

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: bottomSelectedColor,
        backgroundColor: bottomNavBarColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _bottomNavBarItems,
        activeColor: bottomSelectedColor,
        inactiveColor: Colors.grey,
        backgroundColor: bottomNavBarColor,
      ),
      tabBuilder: (BuildContext context, int index) {
        return _listWidget[index];
      },
    );
  }


}


final List<Widget> _listWidget = [
  HomePage(),
  ExplorePage(),
  AiPage(),
  ArticlePage(),
  ProfilePage()
];

List<BottomNavigationBarItem> _bottomNavBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Platform.isIOS ? CupertinoIcons.home : Icons.home),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Icon(Platform.isIOS ? CupertinoIcons.map : Icons.explore_rounded),
    label: "Explore",
  ),
  BottomNavigationBarItem(
    icon: Icon(Platform.isIOS ? CupertinoIcons.rocket : Icons.rocket),
    label: "AI BUSARA",
  ),
  BottomNavigationBarItem(
    icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.newspaper),
    label: "Article",
  ),
  BottomNavigationBarItem(
    icon: Icon(Platform.isIOS ? CupertinoIcons.profile_circled : Icons.person),
    label: "Personal",
  ),
];