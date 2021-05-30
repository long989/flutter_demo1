import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class QRCodePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new QRCodePageState();
  }

}
class QRCodePageState extends State<QRCodePage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("二维码"),
          centerTitle: true,
        ),
      ),
    );
  }

}