import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Wrap And Flow",
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap And Flow'),
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                Text('XXX'*100),
              ],
            ),

            Wrap(
              spacing: 8.0,
              runSpacing: 10.0,
              alignment: WrapAlignment.center,
              children: <Widget>[
                Chip(
                  label: Text('hahshdj'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                ),
                Chip(
                  label: Text('hahshdj'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('B'),
                  ),
                ),
                Chip(
                  label: Text('hahshdj'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('C'),
                  ),
                ),
                Chip(
                  label: Text('hahshdj'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('D'),
                  ),
                ),
              ],
            ),

            Container(
              color: Colors.deepOrange,
              child: Flow(
                delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
                children: <Widget>[
                  new Container(width: 80.0, height: 80.0, color: Colors.blue),
                  new Container(width: 80.0, height: 80.0, color: Colors.blue),
                  new Container(width: 80.0, height: 80.0, color: Colors.blue),
                  new Container(width: 80.0, height: 80.0, color: Colors.blue),
                  new Container(width: 80.0, height: 80.0, color: Colors.blue),
                  new Container(width: 80.0, height: 80.0, color: Colors.blue),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

}