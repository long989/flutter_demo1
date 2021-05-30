import 'package:flutter/material.dart';
import 'package:flutter_demo/test2/pages/home_page.dart';
import 'package:flutter_demo/test2/pages/my_page.dart';
import 'package:flutter_demo/test2/pages/search_page.dart';
import 'package:flutter_demo/test2/pages/travel_page.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final PageController _pageController = PageController(
    initialPage: 0, //默认显示的页面
  );
  var _defultColor = Colors.grey;
  var _activeColor = Colors.blue;
  var _currentIndex = 0;

  void _tabClickItem(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          _tabClickItem(index);
//          _currentIndex = index;
        },
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _tabClickItem,
          currentIndex: _currentIndex,
          items: [
            _bottomItem("首页", Icons.home, 0),
            _bottomItem("搜索", Icons.search, 1),
            _bottomItem("测试", Icons.transfer_within_a_station, 2),
            _bottomItem("我的", Icons.account_circle, 3),
          ]),
    );
  }

  _bottomItem(String title, IconData icon, int index) {
   return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex == index ? _activeColor : _defultColor),
        ));
  }
}
