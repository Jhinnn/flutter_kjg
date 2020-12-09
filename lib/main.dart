import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kpht/navigator/tab_navigater.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.dark
    );
    SystemChrome.setSystemUIOverlayStyle(style);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FCtrip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'PingFang',
      ),
      home: TabNavigator(),
    );
  }
}

/*
class FPBottomNavigationBar extends StatefulWidget {
  _FPHomeWidgetState createState() => _FPHomeWidgetState();
}

class _FPHomeWidgetState extends State<FPBottomNavigationBar> {
  int _selectIndex = 0;
  final List<Widget> _childList = [HomePage(),NewsPage(),VideoPage(),MinePage()];
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

*/