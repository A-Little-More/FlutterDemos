import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimationDemo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      routes: {
        "scaleAnimation": (context) => new ScaleAnimationRoute(),
        "ScaleAnimationImageRoute": (context) => new ScaleAnimationImageRoute(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<String>_list = ["scaleAnimation", "ScaleAnimationImageRoute"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimationDemo')),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_list[index], style: TextStyle(color: Colors.blue)),
              onTap: () {
                Navigator.of(context).pushNamed(_list[index], arguments: _list[index]);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(height: .0, color: Colors.grey);
          },
        ),
      ),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  ScaleAnimationRouteState createState() {
    return ScaleAnimationRouteState();
  }
}

class ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      duration: const Duration(
        seconds: 3
      ),
      vsync: this
    );
    // 线性变化
//    animation = new Tween(begin: 0.0, end: 300.0).animate(animationController)
//      ..addListener(() {
//        setState(() {});
//      });
    //非线性变化
    animation = CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Image.asset("images/my_painting.jpg",
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class AnimationImage extends AnimatedWidget {
  AnimationImage({Key key, Animation<double> animation})
    : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double>animation = listenable;
    return new Center(
      child: Image.asset("images/my_painting.jpg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return new Container(
            child: child,
            width: animation.value,
            height: animation.value,
          );
        },
        child: child,
      ),
    );
  }
}

class ScaleAnimationImageRoute extends StatefulWidget {
  @override
  ScaleAnimationImageRouteState createState() {
    return ScaleAnimationImageRouteState();
  }
}

class ScaleAnimationImageRouteState extends State<ScaleAnimationImageRoute> with SingleTickerProviderStateMixin {
  Animation<double>animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this
    );
    animation = new CurvedAnimation(parent: animationController, curve: Curves.easeInCirc);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: new GrowTransition(
        animation: animation,
        child: Image.asset("images/my_painting.jpg"),
      ),
//      body: new AnimationImage(
//        animation: animation,
//      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}