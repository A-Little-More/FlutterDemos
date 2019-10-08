import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Complex Layout",
      theme: ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complex Layout')),
      body: CustomCard(),
    );
  }
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            child: Container(
//            color: Colors.blue,
                child: Container(
//              color: Colors.grey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text('这是一点描述'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: <Widget>[
                            SingleItemWidget(icon: Icon(Icons.star), num: 1000),
                            SingleItemWidget(icon: Icon(Icons.link), num: 1000),
                            SingleItemWidget(icon: Icon(Icons.menu), num: 1000),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}

class SingleItemWidget extends StatelessWidget {
  final Icon icon;
  final int num;

  SingleItemWidget({this.icon, this.num});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
//        color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            Padding(
              padding: EdgeInsets.only(left: 8.0),
            ),
            Text(num.toString())
          ],
        ),
      )
    );
  }
}
