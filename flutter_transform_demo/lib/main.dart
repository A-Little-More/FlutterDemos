import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transfrom',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  Widget transform1 = Container(
    color: Colors.black,
    child: Transform(
      alignment: Alignment.topRight,
      transform: Matrix4.skewY(0.3),
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.deepOrange,
        child: Text('Apartment for rent'),
      ),
    ),
  );

  Widget transform2 = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
    child: Transform.translate(
      offset: Offset(-20, -5),
      child: Text('Hello World'),
    ),
  );

  Widget transform3 = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
    child: Transform.rotate(
      angle: 1.6,
      child: Text('Hello World'),
    ),
  );

  Widget transform4 = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
    child: Transform.scale(scale: 1.5,
      child: Text('Hello World'),
    ),
  );

  Widget RotateBox = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
        child: RotatedBox(
          quarterTurns: 1,
          child: Text('Hello World'),
        ),
      ),
      Text('你好', style: TextStyle(color: Colors.grey)),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('transform'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          transform1,
          Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: transform2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: transform3,
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: transform4,
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: RotateBox,
          ),
        ],
      ),
    );
  }
}