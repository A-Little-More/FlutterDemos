import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'flutter life timing',
      routes: {
        "counter_page": (context) => CounterWidget()
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('flutter life timing'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed("counter_page");
              },
              child: Text('route next'),
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}


class CounterWidget extends StatefulWidget {
  CounterWidget({Key key, this.initValue: 10});

  final int initValue;

  @override
  CounterWidgetState createState() => new CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.initValue;
    print("init State");
  }

  void increment() {
    setState(() {
      _counter ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: increment,
            child: Text('$_counter'),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

}
