import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOutQuad);
    _animation = Tween(begin: 50.0, end: 100.0).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: _AnimationWidget(
          child: Container(
            color: Colors.yellow,
          ),
          animation: _animation,
        ),
      ),
    );
  }
}


class _AnimationWidget extends StatelessWidget {
  final Widget child;
  final Animation animation;

  _AnimationWidget({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          child: child,
          width: animation.value,
          height: animation.value,
        );
      },
      child: child,
    );
  }

}
