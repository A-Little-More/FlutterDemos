import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args),
      ),
      body: Center(
        child: Text('This is new route'),
      ),
    );
  }
}