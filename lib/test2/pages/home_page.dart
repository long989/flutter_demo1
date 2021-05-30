import 'package:flutter/material.dart';
import 'package:flutter_demo/bean/TKNavigation.dart';
import 'package:flutter_demo/utils/dio_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=124279086,237337896&fm=26&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3344322894,2543775328&fm=26&gp=0.jpg",
    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2345063080,4189360083&fm=26&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1069592129,251555699&fm=26&gp=0.jpg"
  ];
  List<Result> resultList;
@override
  void initState() {
    super.initState();
    DioUtil().getBanner().then((results){
      setState(() {
        resultList = results;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return Scaffold(
      body: Column(
        //列
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(500), //适配，当前banner的高度
            child: Swiper(
              // 横向
              scrollDirection: Axis.horizontal,
              // 数量
              itemCount: resultList.length,
              // 自动翻页
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                //加载图片
                return Image.network(resultList[index].picture,
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
        ],
      )
    );
  }
}
