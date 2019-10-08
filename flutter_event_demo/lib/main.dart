import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event')),
      body: Column(
        children: <Widget>[
          Listener(
            child: Center(
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                width: 300.0,
                height: 150.0,
                child: Text(_event?.toString() ?? "", style: TextStyle(color: Colors.white)),
              ),
            ),
            onPointerDown: (PointerDownEvent event) {
              setState(() {
                _event = event;
              });
            },
            onPointerMove: (PointerMoveEvent event) {
              setState(() {
                _event = event;
              });
            },
            onPointerUp: (PointerUpEvent event) {
              setState(() {
                _event = event;
              });
            },
          ),

          Listener(
            child: Container(
//              color: Colors.clear,
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                child: Center(child: Text("Box A")),
              ),
            ),
            //在命中测试时，将当前Widget当成不透明处理(即使本身是透明的)，最终的效果相当于当前Widget的整个区域都是点击区域。
            behavior: HitTestBehavior.opaque,
            onPointerDown: (event) {
              print("Down A");
            },
          ),

          Stack(
            children: <Widget>[
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                  child: DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
                ),
                onPointerDown: (event) => print("dowm 0"),
              ),
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                  child: Center(child: Text('左上角200*100范围内非文本区域点击')),
                ),
                onPointerDown: (event) => print("down 1"),
                behavior: HitTestBehavior.translucent,
              ),
            ],
          ),

          Listener(
            // IgnorePointer
            // AbsorbPointer
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event) => print("in"),
              ),
            ),
            onPointerDown: (event) => print("up"),
          ),

        ],
      ),
    );
  }
}