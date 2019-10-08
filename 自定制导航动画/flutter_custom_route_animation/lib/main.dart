import 'package:flutter/material.dart';
import 'customRoute.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自定制导航动画',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自定制导航动画')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.navigate_next),
                  iconSize: 65.0,
                  color: Colors.deepOrange,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return SecondPage();
                    }));
                  },
                ),
                Text('默认动画'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.navigate_next),
                  iconSize: 65.0,
                  color: Colors.deepOrange,
                  onPressed: () {
                    Navigator.of(context).push(
                      FadeRoute(
                        child: SecondPage(),
                        duration: 500,
                        type: "Fade"
                      ),
                    );
                  },
                ),
                Text('Fade动画'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.navigate_next),
                  iconSize: 65.0,
                  color: Colors.deepOrange,
                  onPressed: () {
                    Navigator.of(context).push(
                      FadeRoute(
                          child: SecondPage(),
                          duration: 500,
                          type: "Scale"
                      ),
                    );
                  },
                ),
                Text('Scale动画'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.navigate_next),
                  iconSize: 65.0,
                  color: Colors.deepOrange,
                  onPressed: () {
                    Navigator.of(context).push(
                      FadeRoute(
                          child: SecondPage(),
                          duration: 500,
                          type: "ScaleAndRotate"
                      ),
                    );
                  },
                ),
                Text('ScaleAndRotate动画'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.navigate_next),
                  iconSize: 65.0,
                  color: Colors.deepOrange,
                  onPressed: () {
                    Navigator.of(context).push(
                      FadeRoute(
                          child: SecondPage(),
                          duration: 500,
                          type: "Slide"
                      ),
                    );
                  },
                ),
                Text('Slide动画'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SecondPage')),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.navigate_before),
          iconSize: 65.0,
          color: Colors.blue,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
