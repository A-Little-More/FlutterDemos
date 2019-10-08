import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "传值",
      theme: ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('去找小姐姐')),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            this._GoToFindJieJie(context);
          },
          child: Text('去找小姐姐'),
        ),
      ),
    );
  }

   _GoToFindJieJie(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return JieJie();
        }
      )
    );
    print("^^^^^^^$result");
//    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }

}
class JieJie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('小姐姐列表')),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('大长腿：1882222222'),
              onPressed: () {
                Navigator.pop(context, '大长腿：1882222222');
              },
            ),
            RaisedButton(
              child: Text('小蛮腰：1884444444'),
              onPressed: () {
                Navigator.pop(context, '小蛮腰：1884444444');
              },
            ),
          ],
        ),
      ),
    );
  }
}
