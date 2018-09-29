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

  void _openNewPage() {
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.greenAccent,///遮盖颜色 屏幕
        barrierDismissible: false,//点击背景是否返回
        barrierLabel: 'fafa',
//        maintainState: ,///维护状态
        transitionDuration: Duration(seconds: 2),
        pageBuilder: (BuildContext context, _, __) {
          return new Center(child: new Text('定制页面路由'));
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(
            opacity: animation,
            child: new RotationTransition(
              turns: new Tween<double>(begin: 0.8, end: 1.0).animate(animation),
              child: child,
            ),
          );
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Text(
          '点击浮动按钮打开定制页面',
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _openNewPage,
        child: new Icon(Icons.open_in_new),
      ),
    );
  }
}