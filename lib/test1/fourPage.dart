import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FourPage extends StatefulWidget {
  Intent intent;

  @override
  State<StatefulWidget> createState() {
    return new FourPageState(intent);
  }

  FourPage({Key key, @required this.intent}) : super(key: key);
}

class FourPageState extends State<FourPage> {
  Intent intent;

  FourPageState(Intent intent) {
    this.intent = intent;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(intent.name),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[

            ],
          ),
        ),
      ),
    );
  }
}

class Intent {
  var name;
}
