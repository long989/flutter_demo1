import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TwoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TwoPageState();
  }
}

class TwoPageState extends State<TwoPage> {
  List images = [
    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4256012555,3322471696&fm=26&gp=0.jpg",
    "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1415608684,882921790&fm=26&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3155321354,2109662912&fm=26&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2725926826,502136043&fm=26&gp=0.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text("运单"),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: ScreenUtil.getInstance().setHeight(500),
              child: Swiper(
                scrollDirection: Axis.horizontal,
                // 横向
                itemCount: images.length,
                // 数量
                autoplay: true,
                // 自动翻页
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(images[index], fit: BoxFit.fill);
                },
                // 构建
                onTap: (index) {
                  print('点击了第${index}');
                },
                // 点击事件 onTap
                pagination: SwiperPagination(
                    // 分页指示器
                    alignment: Alignment.bottomCenter,
                    // 位置 Alignment.bottomCenter 底部中间
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
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
}
