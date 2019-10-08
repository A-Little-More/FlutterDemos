import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'actions/main_action.dart';
import 'reducers/main_reducer.dart';
import 'states/counterState.dart';

void main() {
  Store<CounterState> store = Store<CounterState>(mainReducer, initialState: CounterState(0));
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  MyApp({this.store});
  final Store<CounterState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StoreConnector<CounterState, int>(
          builder: (BuildContext context, int counter) {
            return _MyFirstPage(counter: counter);
          },
          converter: (Store<CounterState> store) {
            return store.state.count;
          },
        ),
      ),
    );
  }
}

class _MyFirstPage extends StatelessWidget {
  final counter;
  _MyFirstPage({this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('first page')),
      body: StoreConnector<CounterState, int>(
        builder: (BuildContext context, int counter) {
          return Center(
            child: Text(counter.toString(),
              style: TextStyle(color: Colors.red, fontSize: 25.0),
            ),
          );
        },
        converter: (Store<CounterState> store) {
          return store.state.count;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) {
              return _MyHomePageState();
            }
          ));
        },
      ),
    );
  }
}

class _MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('homePage'),
      ),
      body: StoreConnector<CounterState, int>(
        builder: (BuildContext context, int counter) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  counter.toString(),
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          );
        },
        converter: (Store<CounterState> store) {
          return store.state.count;
        },
      ),
      floatingActionButton: StoreConnector(
        builder: (BuildContext context, VoidCallback callback) {
          return FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
        converter: (Store<CounterState> store) {
          return () => store.dispatch(MainAction.Increase);
        },
      ),
    );
  }
}
