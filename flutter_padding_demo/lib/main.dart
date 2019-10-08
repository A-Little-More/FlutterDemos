import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Padding',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Container(
                    color: Colors.blue,
                    child: Text('Hello World'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                child: Text('I am Jack'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
                child: Text('Your friends'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}