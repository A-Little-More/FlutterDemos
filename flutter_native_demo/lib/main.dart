import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Native Demo',
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
  String result;

  @override
  void initState() {
    super.initState();
    result = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Native Demo'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(this.result),
              SizedBox(height: 50),
              FlatButton(
                child: Text('getNative'),
                onPressed: () async {
                  const platform = const MethodChannel('com.test.callIos');
                  String result = await platform.invokeMethod('getName');
                  setState(() {
                    this.result = result;
                  });
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}