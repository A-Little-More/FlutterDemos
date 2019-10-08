import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '保持页面状态',
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

class MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('保持页面状态'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.hot_tub)),
            Tab(icon: Icon(Icons.headset)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          SingleView(),
          SingleView(),
          SingleView(),
        ],
      ),
    );
  }
}

class SingleView extends StatefulWidget {
  @override
  _SingleViewState createState() {
    return _SingleViewState();
  }
}

class _SingleViewState extends State<SingleView> with AutomaticKeepAliveClientMixin {
  int _count = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  void _incrementTap() {
    setState(() {
      _count ++;
    });
  }

}