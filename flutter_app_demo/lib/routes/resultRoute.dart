import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Route',
      home: new MyHomePage(title: '应用程序首页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _result = '';

  Future<Null> _openNewPage() async {
    var value = await Navigator
        .of(context)
        .push(new MaterialPageRoute<String>(builder: (BuildContext context) {
      return new Center(
        child: new GestureDetector(
          child: new Text("确定"),
          onTap: () {
            Navigator.of(context).pop('ss');
          },
        ),
      );
    }));

    setState(() {
      _result = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Text(
          '用户当前选择为 $_result',
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _openNewPage,
        child: new Icon(Icons.open_in_new),
      ),
    );
  }
}