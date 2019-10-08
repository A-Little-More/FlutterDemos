import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http Client',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  bool _loading = false;
  String _text = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Http Client')),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('获取百度首页'),
                onPressed: _loading ? null : () async {
                  setState(() {
                    _loading = true;
                    _text = "正在请求...";
                  });
                  try {
                    HttpClient httpClient = HttpClient();
                    HttpClientRequest request = await httpClient.getUrl(
                      Uri.parse("https://www.baidu.com")
                    );
                    request.headers.add("user-agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
                    HttpClientResponse response = await request.close();
                    _text = await response.transform(utf8.decoder).join();
                    httpClient.close();
                  } catch (e) {
                    _text = "请求失败：$e";
                  } finally {
                    setState(() {
                      _loading = false;
                    });
                  }
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(_text.replaceAll(new RegExp(r"\s"), "")),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
