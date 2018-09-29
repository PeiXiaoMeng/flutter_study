import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Route',
      theme: new ThemeData(
        primaryColor: Colors.greenAccent,
      ),
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
  void openNewPage() {
    setState(() {
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (ctx) {
            return new Scaffold(
              appBar: new AppBar(title: new Text('新的页面')),
              body: new Center(
                child: new Text(
                  '点击浮动按钮返回首页',
                ),
              ),
              floatingActionButton: new FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Icon(Icons.replay),
              ),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Text('点击浮动按钮打开新页面'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {openNewPage();},
        child: new Icon(Icons.refresh),
      ),
    );
  }
}