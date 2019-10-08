import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "闪屏动画",
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 8000), vsync: this);
    _animation = Tween(begin: 0.2, end: 1.0).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) {
              return MyHomePage();
            }
          ),
        (route) {
            return route == null;
        }
        );
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546851657199&di=fdd278c2029f7826790191d59279dbbe&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0112cb554438090000019ae93094f1.jpg%401280w_1l_2o_100sh.jpg",
        scale: 2.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("闪屏动画")),
      body: Center(
        child: Text('我是首页'),
      ),
    );
  }
}