import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GestureDemo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      routes: {
        "SampleGestureRoute": (context) => new SampleGestureRoute(),
        "_DragRoute": (context) => new _DragRoute(),
        "_ScaleRoute": (context) => new _ScaleRoute(),
        "GestureRecognizerRoute": (context) => new GestureRecognizerRoute(),
        "NotificationRoute": (context) => new NotificationRoute(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<String> _list = ["SampleGestureRoute", "_DragRoute", "_ScaleRoute", "GestureRecognizerRoute", "NotificationRoute"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GestureDemo')),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(_list[index]),
                  onTap: () {
                    Navigator.of(context).pushNamed(_list[index], arguments: _list[index]);
                  }
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: .0,
                color: Colors.deepOrange,
              );
            },
            itemCount: _list.length
        ),
      ),
    );
  }
}


class SampleGestureRoute extends StatefulWidget {
  @override
  _SampleGestureRouteState createState() {
    return _SampleGestureRouteState();
  }
}

class _SampleGestureRouteState extends State<SampleGestureRoute> {
  String _operation = "No Gesture detected!";
  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(_operation, style: TextStyle(color: Colors.white)),
          ),
          onTap: () => this.updateText("Tap"),
          onDoubleTap: () => this.updateText("DoubleTap"),
          onLongPress: () => this.updateText("LongPress"),
        ),
      ),
    );
  }

  void updateText(String str) {
    setState(() {
      _operation = str;
    });
  }
}

class _DragRoute extends StatefulWidget {
  @override
  _DragRouteState createState() {
    return _DragRouteState();
  }
}

class _DragRouteState extends State<_DragRoute> with SingleTickerProviderStateMixin {
  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              onPanDown: (DragDownDetails e) {
                print("用户手指按下: ${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e) {
                setState(() {
                  _top += e.delta.dy;
                  _left += e.delta.dx;
                });
              },
              onPanEnd: (DragEndDetails e) {
                print(e.velocity);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ScaleRoute extends StatefulWidget {
  @override
  _ScaleRouteState createState() {
    return _ScaleRouteState();
  }
}

class _ScaleRouteState extends State<_ScaleRoute> {
  double _width = 200.0;
  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: GestureDetector(
          child: Image.asset("images/2.jpg", width: _width),
          onScaleUpdate: (ScaleUpdateDetails e) {
            setState(() {
              _width = 200 * e.scale.clamp(0.8, 10);
            });
          },
        ),
      ),
    );
  }
}

class GestureRecognizerRoute extends StatefulWidget {
  @override
  _GestureRecognizerRouteState createState() {
    return _GestureRecognizerRouteState();
  }
}

class _GestureRecognizerRouteState extends State<GestureRecognizerRoute> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "你好世界"),
              TextSpan(
                text: "点我变色",
                style: TextStyle(
                  color: _toggle ? Colors.red : Colors.black,
                  fontSize: 30.0,
                ),
                recognizer: _tapGestureRecognizer
                  ..onTap = () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  }
              ),
              TextSpan(text: "你好世界"),
            ]
          )
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}

class NotificationRoute extends StatefulWidget {
  @override
  NotificationRouteState createState() {
    return NotificationRouteState();
  }
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: NotificationListener<MyNotification> (
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + " ";
          });
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return RaisedButton(
                    onPressed: () => MyNotification("hi").dispatch(context),
                    child: Text('Send Notification'),
                  );
                },
              ),
              Text(_msg),
            ],
          ),
        ),
      ),
    );
  }

}