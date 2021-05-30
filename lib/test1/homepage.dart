import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/test1/onePage.dart';
import 'package:flutter_demo/test1/threePage.dart';
import 'package:flutter_demo/test1/twoPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int current = 0;
  var currentPage;
  List tabBodies = [
    OnePage(),
    TwoPage(),
    ThreePage(),
  ];

  @override
  void initState() {
    currentPage = tabBodies[current];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      current = index;
      currentPage = tabBodies[current];
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> bottomTabs = [
      BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.home,
          ),
          title: Text(
            '首页',
          )),
      BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.group_solid,
          ),
          title: Text(
            '运单',
          )),
      BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.profile_circled,
          ),
          title: Text(
            '我的',
          )),
    ];
    return MaterialApp(
      home: new Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          iconSize: 24.0,
          type: BottomNavigationBarType.fixed,
          currentIndex: current,
          onTap: _onItemTapped,
          fixedColor: Colors.red,
          items: bottomTabs,
        ),
        body: currentPage,
      ),
    );
  }
}
