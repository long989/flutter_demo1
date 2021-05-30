import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/bean/TKNavigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OnePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OnePageState();
  }
}

class OnePageState extends State<OnePage> {
  List images = [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=124279086,237337896&fm=26&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3344322894,2543775328&fm=26&gp=0.jpg",
    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2345063080,4189360083&fm=26&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1069592129,251555699&fm=26&gp=0.jpg"
  ];
  List<Result> banners = List();
  @override
  void initState() {
    super.initState();
    getBanner().then((result){
      setState(() {
        banners = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          //标题栏
          centerTitle: true, //设置显示位置，当前是显示在中间
          title: Text("首页"), //标题
        ),
        body: new Column(
          //列
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: ScreenUtil.getInstance().setHeight(500), //适配，当前banner的高度
              child: Swiper(
                // 横向
                scrollDirection: Axis.horizontal,
                // 数量
                itemCount: banners.length,
                // 自动翻页
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  //加载图片
                  return Image.network(banners[index].picture,
                      fit: BoxFit.fill);
                },

                onTap: (index) {
                  print('点击了第${index}');
                },
                // 点击事件 onTap
                pagination: SwiperPagination(
                    // 分页指示器
                    alignment: Alignment.bottomCenter,
                    // 位置 Alignment.bottomCenter 底部中间
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    // 距离调整
                    builder: DotSwiperPaginationBuilder(
                        // 指示器构建
                        space: 5,
                        // 点之间的间隔
                        size: 10,
                        // 没选中时的大小
                        activeSize: 12,
                        // 选中时的大小
                        color: Colors.black54,
                        // 没选中时的颜色
                        activeColor: Colors.white)),
                // 选中时的颜色
//                control: new SwiperControl(color: Colors.pink),
                // 页面控制器 左右翻页按钮
                scale: 0.95, // 两张图片之间的间隔
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Expanded灵活布局，如果控件没有填充满界面，使用Expanded会使控件填充满
                  //比如下面三个都加上Expanded，三个按钮均分，如果只加一个，不加的两个只在所在空间显示，另外一个会显示剩余的空间
                  Expanded(
                      //设置点击事件，使用InkWell包裹自主要点击的区域
                      child: new InkWell(
                    //点击事件
                    onTap: () {
                      //显示在底部提示信息
                      Scaffold.of(context).showSnackBar(new SnackBar(
                        content: Text("二维码"), //显示内容
                        duration: Duration(seconds: 1), //snackbar显示时长1秒
                        backgroundColor: Colors.deepPurple, //背景色
                      ));
                    },
                    child: Container(
                      child: new Column(
                        children: <Widget>[
                          Icon(Icons.contact_mail),
                          Text("二维码"),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                    child: new InkWell(
                      onTap: () {
                        //显示在底部提示信息
                        Scaffold.of(context).showSnackBar(new SnackBar(
                          content: Text("智能磅室"), //显示内容
                          duration: Duration(seconds: 1), //snackbar显示时长1秒
                          backgroundColor: Colors.deepPurple, //背景色
                        ));
                      },
                      child: new Column(
                        children: <Widget>[
                          Icon(Icons.smartphone),
                          Text("智能磅室")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: new InkWell(
                    onTap: () {
                      //点击事件
                      //显示在底部提示信息
                      Scaffold.of(context).showSnackBar(new SnackBar(
                        content: Text("平台货源"), //显示内容
                        duration: Duration(seconds: 1), //snackbar显示时长1秒
                        backgroundColor: Colors.deepPurple, //背景色
                      ));
                    },
                    child: new Column(
                      children: <Widget>[
                        Icon(Icons.airport_shuttle),
                        Text("平台货源")
                      ],
                    ),
                  )),
                  Expanded(
                      child: new InkWell(
                    onTap: () {
                      //点击事件
                      //显示在底部提示信息
                      Scaffold.of(context).showSnackBar(new SnackBar(
                        content: Text("今日报表"), //显示内容
                        duration: Duration(seconds: 1), //snackbar显示时长1秒
                        backgroundColor: Colors.deepPurple, //背景色
                      ));
                    },
                    child: new Column(
                      children: <Widget>[Icon(Icons.table_chart), Text("今日报表")],
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: new ListView(
                children: this.getList(context),
              ),
            )
          ],
        ),
        /* body: new ListView(
        children: this.getList(context),
      )*/
      ),
    );
  }

  var list = ["刘德华", "张学友", "黎明", "郭富城"];

  getList(BuildContext context) {
    Iterable<Widget> listTitles = list.map((String name) {
      return new ListTile(
        title: new Text(name + "真棒"),
        //标题
        subtitle: new Text(name + "真厉害"),
        //富文本内容，这里使用Text
        isThreeLine: false,
        leading: new CircleAvatar(
          //左边的头，这里使用圆形的组件
          child: new Text(name.substring(0, 1)),
        ),
        trailing: new Icon(Icons.arrow_forward_ios),
        //标题右边的组件
        onTap: () {
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

  Future<List<Result>> getBanner() async {
    Map paras = {"role": "GOODSOWNER", "position": "0"};

    Options options = Options(
        headers: {HttpHeaders.acceptHeader: "accept: application/json"});
    Dio dio = Dio();
    final response = await dio.get(
        "http://test.api.kachexiongdi.com/v1/get_navigate_pictures",
        //?role=GOODSOWNER&position=0
        queryParameters: new Map<String,dynamic>.from(paras), //new Map<String,dynamic>.from(paras)
        options: options);
    /*先将字符串转成json*/

    Map<String, dynamic> json = jsonDecode(response.toString());
    /*将Json转成实体类*/
    TKNavigation tkNavigation = TKNavigation.fromJson(json);
    print(response);
    banners = tkNavigation.result;
    return tkNavigation.result;
  }
}
