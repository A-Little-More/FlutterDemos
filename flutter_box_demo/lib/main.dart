import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Box',
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
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
    );
    
    Widget decoratedBox = DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
        borderRadius: BorderRadius.circular(3.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Padding(padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text('Login', style: TextStyle(color: Colors.white)),
      ),
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Box'),
        actions: <Widget>[
          SizedBox(
            width: 20.0,
            height: 20.0,
            child:CircleAvatar(
              child: Icon(Icons.map),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 50.0,
            ),
            child: Container(
              child: redBox,
              height: 5.0,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: redBox,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 100.0,
                minWidth: 100.0,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 200.0,
                  minHeight: 50.0,
                ),
                child: redBox,
              ),
            ),
          ),

          decoratedBox,

        ],
      ),
    );
  }
}