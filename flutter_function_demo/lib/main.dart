import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Function Widget',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: {
        "willPopRoute": (context) => new WillPopScopeRoute(),
        "InheriteRoute": (context) => new InheriteWidgetRoute(),
        "ThemeDataRoute": (context) => new ThemeTestRoute(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Function Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text(
                'willPopScope',
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("willPopRoute");
              },
            ),
            FlatButton(
              child: Text(
                'InheriteRoute',
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("InheriteRoute");
              },
            ),
            FlatButton(
              child: Text(
                'ThemeTestRoute',
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("ThemeDataRoute");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WillPopScopeRoute extends StatefulWidget {
  @override
  _WillPopScopeRouteState createState() {
    return _WillPopScopeRouteState();
  }
}

class _WillPopScopeRouteState extends State<WillPopScopeRoute> {

  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('pop')),
      body: new WillPopScope(
          child: Container(
            alignment: Alignment.center,
            child: Text('1秒内连续两次返回键退出'),
          ),
          onWillPop: () async {
            if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
              _lastPressedAt = DateTime.now();
              return false;
            }
            return true;
          }
      ),
    );
  }
}


class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    @required this.data,
    Widget child,
  }): super(child: child);

  final int data;

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() {
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("Dependencies change");
  }
}

class InheriteWidgetRoute extends StatefulWidget {
  @override
  _InheriteWidgetRouteState createState() {
    return _InheriteWidgetRouteState();
  }
}

class _InheriteWidgetRouteState extends State<InheriteWidgetRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InheriteTest')),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(),
              ),
              RaisedButton(
                child: Text('Increment'),
                onPressed: () {
                  setState(() {
                    count ++;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRoute createState() {
    return _ThemeTestRoute();
  }
}

class _ThemeTestRoute extends State<ThemeTestRoute> {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
        primaryColor: _themeColor,
        iconTheme: IconThemeData(color: _themeColor)
      ),
      child: Scaffold(
        appBar: AppBar(title: Text('主题测试')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite_border),
                Icon(Icons.airport_shuttle),
                Text('颜色跟随主题'),
              ],
            ),
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                  color: Colors.black,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite_border),
                  Icon(Icons.airport_shuttle),
                  Text('颜色固定黑色'),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.palette),
          onPressed: () {
            setState(() {
              _themeColor = _themeColor == Colors.teal ? Colors.blue : Colors.teal;
            });
          },
        ),
      ),
    );
  }
}
