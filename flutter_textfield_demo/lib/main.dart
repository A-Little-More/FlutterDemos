import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(),
    home: FormTest(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _unameController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _unameController.addListener(() {
      print(_unameController.text);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('textField'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _unameController,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          FocusTest(),
          Theme(
            data: Theme.of(context).copyWith(
              hintColor: Colors.red,
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.yellow),
                hintStyle: TextStyle(color: Colors.green, fontSize: 16.0),
              ),
            ),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "自定义",
                  hintText: "文字",
                  prefixIcon: Icon(Icons.print),
                  border: InputBorder.none,
                ),
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1.0, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FocusTest extends StatefulWidget {
  @override
  _FocusTestState createState() => new _FocusTestState();
}

class _FocusTestState extends State<FocusTest> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            decoration: InputDecoration(
              labelText: "input1",
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
              labelText: "input2",
            ),
          ),
          Builder(builder: (context) {
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('移动焦点'),
                  onPressed: () {
                    if (focusScopeNode == null) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text('隐藏焦点'),
                  onPressed: () {
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}


class FormTest extends StatefulWidget {
  @override
  _FormTestState createState() => new _FormTestState();
}

class _FormTestState extends State<FormTest> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form test'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.red,
                child: TextFormField(
                  autofocus: true,
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    return value
                        .trim()
                        .length > 0 ? null : "用户名不能为空";
                  },
                ),
              ),
              Container(
                color: Colors.blue,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    return value
                        .trim()
                        .length > 5 ? null : "密码不能少于6位";
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text('登录'),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          if ((_formKey.currentState as FormState).validate()) {
                            print("验证成功");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}