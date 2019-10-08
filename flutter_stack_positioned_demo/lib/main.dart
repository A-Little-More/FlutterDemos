import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Positioned',
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
        title: Text('Stack Positioned'),
      ),
      body: Container(
        color: Colors.teal,
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Text(
                  'Hello World',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Positioned(
                left: 18.0,
                child: Text('I am Jack'),
              ),
              Positioned(
                top: 20.0,
                height: 100.0,
                width: 200.0,
                child: Container(
                  color: Colors.white,
                  child: Text('Your friends'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}