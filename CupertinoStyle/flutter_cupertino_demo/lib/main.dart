import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "CupertinoStyle",
      theme: CupertinoThemeData(
        primaryColor: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino'),
      ),
      child: Center(
        child: Tooltip(
          message: "长按轻量级提示",
          child: Container(
            height: 100.0,
            width: 100.0,
            color: CupertinoColors.activeBlue,
            child: CupertinoButton(
              child: Icon(CupertinoIcons.add),
              onPressed: () {
                Navigator.of(context).push(
                    CupertinoPageRoute(
                        builder: (context) {
                          return MyHomePage();
                        }
                    )
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
