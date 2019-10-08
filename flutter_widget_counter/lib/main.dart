import 'package:flutter/material.dart';
import 'RoutePage.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Counter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: {
        "new_page": (context) => NewRoute(),
      },
      home: new MyHomePage(title: 'Counter Demo',),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title});
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            new Text(
                'You have pushed the button this many times:'
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1
            ),
            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'new_page', arguments: 'new new new route');
//                  Navigator.push(context,
//                    new MaterialPageRoute(
//                        builder: (context) {
//                          return new NewRoute();
//                        },
//                    )
//                  );
                }, 
                child: Text('open new route'),
                textColor: Colors.blue,
            ),
            new RandomWordsWidget()
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add',
        onPressed: _incrementCounter,
      ),
    );
  }

}