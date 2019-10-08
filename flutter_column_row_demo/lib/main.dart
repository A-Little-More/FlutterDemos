import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Column'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('hello world'),
              Text('I am Jack'),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('hello world'),
              Text('I am Jack'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text('hello world'),
              Text('I am Jack'),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text('hello world', style: TextStyle(fontSize: 30.0)),
              Text('I am Jack'),
            ],
          ),
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text('Hello world'),
                        Text('I am Jack'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            color: Colors.yellow,
            child: Column(
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        height: 30.0,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.blue,
                        height: 40.0,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    height: 100.0,
                    child: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.cyan,
//                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.grey,
//                            height: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
