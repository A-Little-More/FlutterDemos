import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WebSocket",
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
  TextEditingController _controller = new TextEditingController();
  IOWebSocketChannel channel;
  String _text = "";

  @override
  void initState() {
    super.initState();
    channel = new IOWebSocketChannel.connect("wss://echo.websocket.org/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WebSocket')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: "Send Text"),
              ),
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  _text = "网络不通";
                } else if (snapshot.hasData) {
                  _text = "echo: " + snapshot.data;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(_text),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: _sendMessage,
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
