import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: ScaffoldRoute(),
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => new _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('App Name'),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard),
            onPressed: () {
//              Scaffold.of(context).openDrawer();
              _globalKey.currentState.openDrawer();
            },
          );
        }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: new MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('business')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('search')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemtap,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }

  void _onItemtap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {

  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.asset(
                          "images/my_painting.jpg",
                          width: 80,
                        ),
                      ),
                    ),
                    Text("LIDONG", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('Add account'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Manage accounts'),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}