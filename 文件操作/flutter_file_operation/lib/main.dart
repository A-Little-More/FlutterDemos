import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "文件操作",
      theme: ThemeData.light(),
      home: new MyHomePage(),
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
  int _count;

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File("$dir/count.txt");
  }

  Future<int> _readCount() async {
    try {
      File file = await this._getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementTap() async {
    setState(() {
      _count ++;
    });
    await (await this._getLocalFile()).writeAsString("$_count");
  }

  @override
  void initState() {
    super.initState();
    this._readCount().then((value) {
      setState(() {
        _count = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('文件操作')),
      body: Center(
        child: Text(
          "$_count",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _incrementTap,
      ),
    );
  }


}