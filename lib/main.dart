import 'package:flutter/material.dart';
import 'package:flutter_demo/test1/homepage.dart';
import 'package:flutter_demo/test1/onePage.dart';
import 'package:flutter_demo/test2/main_home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '一大把手',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainHome(),
//    home: new OnePage(),
    );
  }
}
