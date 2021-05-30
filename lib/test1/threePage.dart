import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/bean/TKNavigation.dart';
import 'package:flutter_demo/test1/fourPage.dart';

class ThreePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThreePageState();
  }
}

class ThreePageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text("我的"),
        ),
        body: new Column(
          children: <Widget>[
            new InkWell(
              child: new CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              onTap: () {
                var intent = new Intent();
                intent.name = "登录";
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new FourPage(intent: intent)));
              },
            ),
            Text("刘德华"),
            Expanded(
                child: new ListView(
              children: this.getList(context),
            )),
          ],
        ),
      ),
    );
  }

  var list = ["刘德华", "张学友", "黎明", "郭富城"];

  getList(BuildContext context) {
    Iterable<Widget> listTitles = list.map((String name) {
      return new ListTile(
        title: new Text(name + "真棒"),
        //标题
        isThreeLine: false,
        leading: new CircleAvatar(
          //左边的头，这里使用圆形的组件
          child: new Icon(Icons.accessible),
        ),
        trailing: new Icon(Icons.arrow_forward_ios),
        //标题右边的组件
        onTap: () {
          main();
          //点击事件
          //显示在底部提示信息
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text(name), //显示内容
            duration: Duration(seconds: 1), //snackbar显示时长1秒
            backgroundColor: Colors.deepPurple, //背景色
          ));
        },
      );
    });
    return listTitles.toList();
  }
}

void main() async {
  Map paras = {"role": "GOODSOWNER", "position": "0"};

  Options options =
      Options(headers: {HttpHeaders.acceptHeader: "accept: application/json"});
  Dio dio = Dio();
  final response =
      await dio.get("http://test.api.kachexiongdi.com/v1/get_navigate_pictures",
          //?role=GOODSOWNER&position=0
          queryParameters: new Map<String,dynamic>.from(paras), //new Map<String,dynamic>.from(paras)
          options: options);
  /*先将字符串转成json*/
  Map<String, dynamic> json = jsonDecode(response.data.toString());
  /*将Json转成实体类*/
  TKNavigation tkNavigation = TKNavigation.fromJson(json);
  print(response);
}
