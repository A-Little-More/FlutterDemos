import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'singleChildScrollView',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String _str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: _str.split("")
              .map((c) => Text(c, textScaleFactor: 2))
              .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
