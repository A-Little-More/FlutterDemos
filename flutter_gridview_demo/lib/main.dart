import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: {
        "GridView1": (context) => new GridView1(),
        "GridView2": (context) => new GridView2(),
        "GridView3": (context) => new GridView3(),
        "CustomScrollView": (context) => new CustomScrollViewRoute(),
        "ScrollControllerRoute": (context) => new ScrollControllerRoute(),
        "ScrollNotificationRoute": (context) => new ScrollNotificationRoute(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('GridView1', textScaleFactor: 2),
              onPressed: () {
                Navigator.of(context).pushNamed("GridView1");
              },
            ),
            FlatButton(
              child: Text('GridView2', textScaleFactor: 2),
              onPressed: () {
                Navigator.of(context).pushNamed("GridView2");
              },
            ),
            FlatButton(
              child: Text('GridView3', textScaleFactor: 2),
              onPressed: () {
                Navigator.of(context).pushNamed("GridView3");
              },
            ),
            FlatButton(
              child: Text('CustomScrollView', textScaleFactor: 2),
              onPressed: () {
                Navigator.of(context).pushNamed("CustomScrollView");
              },
            ),
            FlatButton(
              child: Text('ScrollControllerRoute', textScaleFactor: 2),
              onPressed: () {
                Navigator.of(context).pushNamed("ScrollControllerRoute");
              },
            ),
            FlatButton(
              child: Text('ScrollNotificationRoute', textScaleFactor: 2),
              onPressed: () {
                Navigator.of(context).pushNamed("ScrollNotificationRoute");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GridView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView1'),
      ),
      body: Container(
        color: Colors.white,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 50.0,
          ),
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Icon(Icons.map),
            ),
            Container(
              color: Colors.red,
              child: Icon(Icons.alarm_off),
            ),
            Icon(Icons.settings),
            Icon(Icons.cached),
            Icon(Icons.airline_seat_flat),
            Icon(Icons.ac_unit),
          ],
        ),
      ),
    );
  }
}


class GridView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView2'),
      ),
      body: Container(
        color: Colors.white,
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 2.0,
            maxCrossAxisExtent: 120,
//            crossAxisSpacing: 10.0,
          ),
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Icon(Icons.map),
            ),
            Container(
              color: Colors.red,
              child: Icon(Icons.alarm_off),
            ),
            Icon(Icons.settings),
            Icon(Icons.cached),
            Icon(Icons.airline_seat_flat),
            Icon(Icons.ac_unit),
          ],
        ),
      ),
    );
  }
}

class GridView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView3'),
      ),
      body: Container(
        color: Colors.white,
        child: InfiniteGridView(),
      ),
    );
  }
}

class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _icons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          if (index == _icons.length - 1 && _icons.length < 150) {
            _getData();
          }
          return Icon(_icons[index]);
        }
    );
  }

  void _getData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airline_seat_flat,
          Icons.cached,
          Icons.fingerprint,
          Icons.vibration,
          Icons.business,
        ]);
      });
    });
  }
}

class CustomScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
              background: Image.asset(
                "images/3.jpg", fit: BoxFit.cover
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 20.0,
                  childAspectRatio: 4.0,
                ),
              delegate: new SliverChildBuilderDelegate((BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('grid item'),
                );
              },childCount: 20),
            ),
          ),
          new SliverFixedExtentList(
              delegate: new SliverChildBuilderDelegate((context, index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item'),
                );
              }, childCount: 50),
              itemExtent: 50,
          ),
        ],
      ),
    );
  }
}


class ScrollControllerRoute extends StatefulWidget {
  @override
  _ScrollControllerRouteState createState() => new _ScrollControllerRouteState();
}

class _ScrollControllerRouteState extends State<ScrollControllerRoute> {
  ScrollController _controller = new ScrollController();
  bool showTopBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showTopBtn) {
        setState(() {
          showTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !showTopBtn) {
        setState(() {
          showTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('滚动控制')),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 50,
          controller: _controller,
          itemBuilder: (context, index) {
            return ListTile(title: Text('$index'));
          },
        ),
      ),
      floatingActionButton: !showTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _controller.animateTo(.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
      ),
    );
  }
}

class ScrollNotificationRoute extends StatefulWidget {
  @override
  _ScrollNotificationRouteState createState() {
    return _ScrollNotificationRouteState();
  }
}

class _ScrollNotificationRouteState extends State<ScrollNotificationRoute> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('滚动距离监听')),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification> (
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 50,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"));
                },
              ),
              CircleAvatar(
                radius: 30.0,
                child: Text("$_progress"),
                backgroundColor: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }

}