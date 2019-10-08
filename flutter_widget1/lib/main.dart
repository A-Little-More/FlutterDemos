import 'package:flutter/material.dart';

//void main() {
//  runApp(
//    new Center(
//      child: new Text(
//        'Hello World!',
//        textDirection: TextDirection.ltr,
//      ),
//    ),
//  );
//}


//class MyAppBar extends StatelessWidget {
//  MyAppBar({this.title});
//  final Widget title;
//
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      height: 106.0,
//      padding: const EdgeInsets.symmetric(horizontal: 8.0),
//      decoration: new BoxDecoration(color: Colors.blue[500]),
//      child: new Row(
//        children: <Widget>[
//          new IconButton(
//              icon: new Icon(Icons.menu),
//              tooltip: 'Navigation menu',
//              onPressed: null
//          ),
//          new Expanded(child: title),
//          new IconButton(
//              icon: new Icon(Icons.search),
//              tooltip: 'Search',
//              onPressed: null
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class MyScaffold extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Material(
//      child: new Column(
//        children: <Widget>[
//          new MyAppBar(
//            title: new Text(
//              'Example title',
//              style: Theme.of(context).primaryTextTheme.title,
//            ),
//          ),
//          new Expanded(
//              child: new Center(
//                child: new Text('Hello World!'),
//              ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//void main() {
//  runApp(
//      new MaterialApp(
//        title: 'My App',
//        home: MyScaffold(),
//      ),
//  );
//}

//void main() {
//  runApp(
//    new MaterialApp(
//      title: 'Flutter Tutorial',
//      home: TutorialHome(),
//    ),
//  );
//}
//
//class TutorialHome extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Scaffold(
//      appBar: new AppBar(
//        leading: new IconButton(
//            icon: new IconButton(
//                icon: new Icon(Icons.menu),
//                tooltip: 'Navigation menu',
//                onPressed: null,
//            ),
//        ),
//        title: new Text('Example Title'),
//        actions: <Widget>[
//          new IconButton(
//              icon: new Icon(Icons.search),
//              tooltip: 'search',
//              onPressed: null,
//          ),
//        ],
//      ),
//      body: new Center(
////        child: new Text('Hello World'),
////        child: new MyButton(),
////        child: Counter(),
//        child: Counter1(),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        tooltip: 'Add',
//        child: new Icon(Icons.add),
//        onPressed: null,
//      ),
//    );
//  }
//}
//
//class MyButton extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new GestureDetector(
//      onTap: () {
//        print('MyButton was Tapped!');
//      },
//      child: new Container(
//        height: 36.0,
//        padding: const EdgeInsets.all(8.0),
//        margin: const EdgeInsets.symmetric(horizontal: 8.0),
//        decoration: new BoxDecoration(
//          borderRadius: new BorderRadius.circular(5.0),
//          color: Colors.lightGreen,
//        ),
//        child: new Center(
//          child: new Text('Engage'),
//        ),
//      ),
//    );
//  }
//}
//
//class Counter extends StatefulWidget {
//  @override
//  _CounterState createState() => new _CounterState();
//}
//
//class _CounterState extends State<Counter> {
//  int _counter = 0;
//
//  void _increment() {
//    setState(() {
//      _counter ++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Row(
//      children: <Widget>[
//        new RaisedButton(
//            onPressed: _increment,
//            child: new Text('Increment'),
//        ),
//        new Text('Count: $_counter'),
//      ],
//    );
//  }
//}
//
//class CounterDisplay extends StatelessWidget {
//  CounterDisplay({this.count});
//  final int count;
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Text('Counter: $count');
//  }
//}
//
//class CounterIncrementor extends StatelessWidget {
//  CounterIncrementor({this.onPress});
//  final VoidCallback onPress;
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new RaisedButton(
//        onPressed: onPress,
//        child: new Text('Increment'),
//    );
//  }
//}
//
//class Counter1 extends StatefulWidget {
//  @override
//  _CounterState1 createState() => _CounterState1();
//}
//
//class _CounterState1 extends State<Counter1> {
//  int _count = 0;
//  void _increment() {
//    setState(() {
//      ++ _count;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Row(
//      children: <Widget>[
//        new CounterIncrementor(
//          onPress: _increment,
//        ),
//        new CounterDisplay(
//          count: _count,
//        ),
//      ],
//    );
//  }
//}

class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.incart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));
  final Product product;
  final bool incart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return incart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!incart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: () {
        onCartChanged(product, incart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}


class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}): super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    print('product: $product, inCart: $inCart');
    setState(() {
      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            incart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList()
      ),
    );
  }
}

void main() {
  runApp(
    new MaterialApp(
      title: 'Shopping App',
      home: new ShoppingList(
        products: <Product>[
          new Product(name: 'Eggs'),
          new Product(name: 'Flour'),
          new Product(name: 'chips'),
        ],
      ),
    ),
  );
}


