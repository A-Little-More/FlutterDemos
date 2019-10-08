import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "流式布局",
      theme: ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('流式布局')),
      body: WrapDemo(),
    );
  }
}

class WrapDemo extends StatefulWidget {
  @override
  WrapDemoState createState() {
    return WrapDemoState();
  }
}

class WrapDemoState extends State<WrapDemo> {

  List<Widget> _list;

  Widget addWidget() {
    return GestureDetector(
      onTap: () {
        if (_list.length < 9) {
          setState(() {
//            _list..add(PhotoWidget());
            _list.insert(_list.length - 1, PhotoWidget());
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget PhotoWidget() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _list = List<Widget>()..add(addWidget());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Opacity(
        opacity: 0.7,
        child: Container(
          width: width,
          height: width,
          color: Colors.grey,
          child: Wrap(
              spacing: 28.0,
              children: _list
          ),
        ),
      ),
    );
  }
}
