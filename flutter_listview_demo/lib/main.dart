import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List View",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: {
        "ListView1Route": (context) => ListView1Route(),
        "ListView2Route": (context) => ListView2Route(),
        "ListView3Route": (context) => ListView3Route(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('ListView1', textScaleFactor: 1.5, style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pushNamed('ListView1Route');
              },
            ),
            FlatButton(
              child: Text('ListView2', textScaleFactor: 1.5, style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pushNamed('ListView2Route');
              },
            ),
            FlatButton(
              child: Text('ListView3', textScaleFactor: 1.5, style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pushNamed('ListView3Route');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListView1Route extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView1'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            const Text('I\'m dedicating every day to you'),
            const Text('Domestic life was never quite my style'),
            const Text('When you smile, you knock me out, I fall apart'),
            const Text('And I thought I was so smart'),
          ],
        ),
      ),
    );
  }
}

class ListView2Route extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(color: Colors.blue);
    Widget divider2 = Divider(color: Colors.green);
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView2'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            ListTile(title: Text('title')),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return index % 2 == 0 ? divider1 : divider2;
                },
                itemCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListView3Route extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView3'),
      ),
      body: InfiniteListView(),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              _getData();
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text('没有更多了', style: TextStyle(color: Colors.grey)),
              );
            }
          }
          return ListTile(
            title: Text(_words[index]),
          );
        },
        separatorBuilder: (context, index) => Divider(height: .0),
        itemCount: _words.length,
    );
  }

  void _getData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
        generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {

      });
    });
  }

}
