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

  void _tapRecognizer() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button',
                textAlign: TextAlign.center,
              ),
              Text(
                'You have pushed the button'*3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'You have pushed the button',
                textScaleFactor: 1.5,
              ),
              Text(
                'You have pushed the button',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: 'Courier',
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
              ),
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: 'Home:'
                  ),
                  TextSpan(
                    text: 'https://www.flutterchina.com',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: null,
                  ),
                ]
              )),
              DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                    fontFamily: 'HanaleiFill',
                  ),
                  textAlign: TextAlign.start,
                  child: Column(
                    children: <Widget>[
                      Text('hello world'),
                      Text('i am jack'),
                      Text('i am jack',
                        style: TextStyle(
                          inherit: false,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
              ),
              Image(
                  image: AssetImage('images/fllm_logo_new.png'),
                  width: 120.0,
              ),
              Image.network('https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
                width: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessibility, color: Colors.green),
                  Icon(Icons.error, color: Colors.green),
                  Icon(Icons.fingerprint, color: Colors.green)
                ],
              ),
              SwitchAndCheckBoxTest(),
            ],
          ),
        ),
      )
    );
  }
}

class SwitchAndCheckBoxTest extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestState createState() => new _SwitchAndCheckBoxTestState();
}

class _SwitchAndCheckBoxTestState extends State<SwitchAndCheckBoxTest> {
  bool _switchSelected = false;
  bool _checkBoxSelected = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,
          onChanged: (value) {
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkBoxSelected,
          onChanged: (value) {
            setState(() {
              _checkBoxSelected = value;
            });
          },
        ),
      ],
    );
  }
}