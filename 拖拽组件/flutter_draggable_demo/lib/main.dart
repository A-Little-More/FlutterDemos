import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Draggable",
      theme: ThemeData.light(),
      home: DraggableDemo(),
    );
  }
}

class DraggableDemo extends StatefulWidget {
  @override
  DraggableDemoState createState() {
    return DraggableDemoState();
  }
}

class DraggableDemoState extends State<DraggableDemo> {
  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text('拖拽')),
      body: Stack(
        children: <Widget>[
          DraggableWidget(
            offset: Offset(80.0, 80.0),
            widgetColor: Colors.redAccent,
          ),
          DraggableWidget(
            offset: Offset(190.0, 80.0),
            widgetColor: Colors.deepPurple,
          ),
          Center(
            child: DragTarget(
              onAccept: (Color color) {
                _draggableColor = color;
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  color: _draggableColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;

  const DraggableWidget({Key key, this.offset, this.widgetColor}): super(key: key);

  @override
  DraggableWidgetState createState() {
    return DraggableWidgetState();
  }
}

class DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.widgetColor,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.widgetColor,
        ),
        feedback: Container(
          width: 110.0,
          height: 110.0,
          color: widget.widgetColor.withOpacity(0.5),
        ),
        onDraggableCanceled: (v, offset) {
          setState(() {
            this.offset = offset;
          });
        },
      ),
    );
  }
}
