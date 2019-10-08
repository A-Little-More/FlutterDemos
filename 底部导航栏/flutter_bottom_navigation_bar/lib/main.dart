import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '底部导航栏',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('底部导航栏')),
      body: Center(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
/**
 *  规则bottomNavigationBar
 * */
//      BottomNavigationBar(
//        items: [
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text('Home'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.sort),
//            title: Text('Sort'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.shopping_cart),
//            title: Text('Cart'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.settings),
//            title: Text('Settings'),
//          ),
//        ],
//        fixedColor: Colors.blue,
//        currentIndex: _selectedIndex,
//        showUnselectedLabels: true,
//        type: BottomNavigationBarType.fixed,
//        onTap: (index) {
//          setState(() {
//            _selectedIndex = index;
//          });
//        },
//      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}