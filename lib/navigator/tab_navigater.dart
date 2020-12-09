import 'package:flutter/material.dart';
import 'package:flutter_kpht/pages/news.dart';
import 'package:flutter_kpht/pages/home.dart';
import 'package:flutter_kpht/pages/video.dart';
import 'package:flutter_kpht/pages/mine.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  final _defaultColor = Color(0xff8a8a8a);
  final _activeColor = Color(0xff50b4ed);
  int _currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          NewsPage(),
          VideoPage(),
          MinePage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.animateToPage(
                index,
                curve: Curves.easeIn, duration: Duration(milliseconds: 10)
            );
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/xiecheng.png',
                width: 22,
                height: 22,
              ),
              activeIcon: Image.asset(
                'images/xiecheng_active.png',
                width: 22,
                height: 22,
              ),
              title: Text(
                '首页',
                style: TextStyle(
                  color: _currentIndex != 0 ? _defaultColor : _activeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/mude.png',
                width: 24,
                height: 24,
              ),
              activeIcon: Image.asset(
                'images/mude_active.png',
                width: 24,
                height: 24,
              ),
              title: Text(
                '目的地',
                style: TextStyle(
                  color: _currentIndex != 1 ? _defaultColor : _activeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/lvpai.png',
                width: 23,
                height: 23,
              ),
              activeIcon: Image.asset(
                'images/lvpai_active.png',
                width: 23,
                height: 23,
              ),
              title: Text(
                '旅拍',
                style: TextStyle(
                  color: _currentIndex != 2 ? _defaultColor : _activeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/wode.png',
                width: 23,
                height: 23,
              ),
              activeIcon: Image.asset(
                'images/wode_active.png',
                width: 23,
                height: 23,
              ),
              title: Text(
                '我的',
                style: TextStyle(
                  color: _currentIndex != 3 ? _defaultColor : _activeColor,
                ),
              ),
            ),
          ]),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
