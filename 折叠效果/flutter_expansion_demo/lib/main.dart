import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '折叠效果',
      theme: ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('折叠效果')),
//      body: ExpansionTileDemo(),
      body: ExpansionPanelListDemo(),
    );
  }
}

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ExpansionTile(
        title: Text('Expansion_Tile'),
        leading: Icon(Icons.ac_unit),
        backgroundColor: Colors.white12,
        children: <Widget>[
          Container(
            color: Colors.black54,
            child: ListTile(
              title: Text('Expansion_list_title'),
              subtitle: Text('subtitle'),
            ),
          ),
        ],
        initiallyExpanded: true,
      ),
    );
  }
}

class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean({this.index, this.isOpen});
}

class ExpansionPanelListDemo extends StatefulWidget {
  @override
  ExpansionPanelListDemoState createState() {
    return ExpansionPanelListDemoState();
  }
}

class ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  List<int>mList;
  List<ExpandStateBean>expandStateList;
  ExpansionPanelListDemoState() {
    mList = new List();
    expandStateList = new List();
    for(int i = 0; i < 10; i ++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(index: i, isOpen: false));
    }
  }

  void expansionCallBack(index, isOpen) {
    setState(() {
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isOpen;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: expansionCallBack,
        children: mList.map((index) {
          return ExpansionPanel(
            headerBuilder: (context, isOpen) {
              return ListTile(
                title: Text('This is Header $index'),
              );
            },
            body: ListTile(
              title: Text('This is Expansion $index'),
            ),
            isExpanded: expandStateList[index].isOpen
          );
        }).toList(),
      ),
    );
  }
}
