import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  Widget ContainerBox = Container(
    margin: EdgeInsets.only(left: 80.0, top: 100.0),
    constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
    decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: [Colors.red, Colors.orange],
        center: Alignment.topLeft,
        radius: .98,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black54,
          offset: Offset(2.0, 2.0),
          blurRadius: 4.0,
        ),
      ],
    ),
    transform: Matrix4.rotationZ(.2),
    alignment: Alignment.center,
    child: Text('Hello World', style: TextStyle(color: Colors.white)),
  );

  Widget Container1 = Container(
    color: Colors.blue,
    child: Container(
      margin: EdgeInsets.all(50.0),
      color: Colors.orange,
      child: Text('Hello World'),
    ),
  );

  Widget Container2 = Container(
    padding: EdgeInsets.all(30.0),
    color: Colors.red,
    child: Text('Hello World'),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Column(
        children: <Widget>[
          ContainerBox,
          Container1,
          Container2,
        ],
      ),
    );
  }
}