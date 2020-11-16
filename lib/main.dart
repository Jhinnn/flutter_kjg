import 'package:flutter/material.dart';
import 'package:flutter_kpht/Main/News.dart';
import 'package:flutter_kpht/Main/Home.dart';
import 'package:flutter_kpht/Main/Video.dart';
import 'package:flutter_kpht/Main/Mine.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FPBottomNavigationBar(),
    );
  }
}

class FPBottomNavigationBar extends StatefulWidget {
  _FPHomeWidgetState createState() => _FPHomeWidgetState();
}

class _FPHomeWidgetState extends State<FPBottomNavigationBar> {
  int _selectIndex = 0;
  final List<Widget> _childList = [Home(),News(),Video(),Mine()];
  final List<BottomNavigationBarItem> _bottomItemList = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.next_week_outlined),title: Text("资讯")),
    BottomNavigationBarItem(icon: Icon(Icons.video_collection_sharp),title: Text("视频")),
    BottomNavigationBarItem(icon: Icon(Icons.open_with),title: Text("我的")),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectIndex = index;
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomItemList,
        currentIndex: _selectIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: _childList[_selectIndex],
    );
  }

}
