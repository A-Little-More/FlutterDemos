import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'buttons',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('raisedButton'),
              onPressed: () => {},
            ),
            FlatButton(
              child: Text('flagButton'),
              onPressed: () => {},
            ),
            OutlineButton(
              child: Text('outlineButton'),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () => {},
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.yellow,
              colorBrightness: Brightness.dark,
              splashColor: Colors.red,
              child: Text('Submit'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//              padding: EdgeInsets.all(20.0),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
