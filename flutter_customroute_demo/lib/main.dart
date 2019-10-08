import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomRoute',
      theme: ThemeData(
        primaryColor: Colors.orange
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<String>list = ["customRoute1", "customRoute2", "StaggerDemoRoute"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CustomRoute')),
      body: Column(
        children: <Widget>[
          ListView.separated(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(list[index]),
                onTap: () {
                  this.pushAnimation(context, index);
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: .0);
            },
            shrinkWrap: true,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: InkWell(
              child: Hero(
                tag: "avatar",
                child: ClipOval(
                  child: Image.asset("images/my_painting.jpg", width: 50.0),
                ),
              ),
              onTap: () {
                this.pushAnimation(context, 3);
              },
            ),
          ),
        ],
      ),
    );
  }
  /*
  *   自定制跳转动画
  * */
  void pushAnimation(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(context, PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context, animation, secAnimation) {
            /*渐隐渐入过度*/
            return new FadeTransition(
              opacity: animation,
              child: new CustomRoute(),
            );
          }
        ));
        break;
      case 1:
        Navigator.push(context, FadeRoute(builder: (context) {
          return CustomRoute();
        }));
        break;
      case 2:
        Navigator.push(context, 
          new MaterialPageRoute(builder: (context) {
            return StaggerDemoRoute();
          }),
        );
        break;
      case 3:
        Navigator.push(context, FadeRoute(builder: (context) {
          return HeroAnimationRoute();
        }));
        break;
    }
  }

}

class CustomRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("customRoute1")),
    );
  }
}


class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
//    if (isActive) {
//      return FadeTransition(
//        opacity: animation,
//        child: builder(context),
//      );
//    } else {
//      return Padding(padding: EdgeInsets.zero);
//    }

    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HeroAnimation')),
      body: Center(
        child: Hero(
          tag: "avatar",
          child: Image.asset("images/my_painting.jpg"),
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller}): super(key: key) {
    height = Tween(begin: .0, end: 300.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.6, curve: Curves.ease),
      ),
    );

    color = ColorTween(begin: Colors.green, end: Colors.red).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.6, curve: Curves.ease),
      ),
    );

    padding = Tween(begin: EdgeInsets.only(left: .0), end: EdgeInsets.only(left: 100.0)).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.6, 1.0, curve: Curves.ease),
      ),
    );
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets>padding;
  Animation<Color>color;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }

}

class StaggerDemoRoute extends StatefulWidget {
  @override
  StaggerDemoRouteState createState() {
    return StaggerDemoRouteState();
  }
}

class StaggerDemoRouteState extends State<StaggerDemoRoute> with TickerProviderStateMixin {
  AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
  }
  
  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {

    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StaggerDemo')),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5)),
            ),
            child: StaggerAnimation(
              controller: _controller,
            ),
          ),
        ),
      ),
    );
  }
  
}