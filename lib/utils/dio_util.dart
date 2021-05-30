import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_demo/bean/TKNavigation.dart';

class DioUtil {
  final String BASE_URL = "http://test.api.kachexiongdi.com/v1";
  static final DioUtil _dioUtil = DioUtil._internal();
  static Dio _dio;

  factory DioUtil() {
    // 或者通过传递一个 `BaseOptions`来创建dio实例
    BaseOptions options = new BaseOptions(
      baseUrl: "http://test.api.kachexiongdi.com",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = Dio(options);
    return _dioUtil;
  }

  DioUtil._internal(); //3
  Future<List<Result>> getBanner() async {
    Map paras = {"role": "GOODSOWNER", "position": "0"};

    final response = await _dio.get(
        "http://test.api.kachexiongdi.com/v1/get_navigate_pictures",
        //?role=GOODSOWNER&position=0
        queryParameters: new Map<String, dynamic>.from(paras));
    Map<String, dynamic> json = jsonDecode(response.toString());
    /*将Json转成实体类*/
    TKNavigation tkNavigation = TKNavigation.fromJson(json);
    return tkNavigation.result;
  }
}
