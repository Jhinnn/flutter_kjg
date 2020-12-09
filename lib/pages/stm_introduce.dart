import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class StmIntroducePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('科技馆介绍',style: TextStyle(
            color: Colors.black87
          ),),
          elevation: 0, //导航栏和内容之间没有阴影
          brightness: Brightness.light, //控制状态栏的颜色，lignt 文字是灰色的，dark是白色的
          backgroundColor: Colors.white, //导航栏和状态栏的的颜色
          leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black87,)
          ),
        ),
        body: WebviewScaffold(
          url: "http://m.spacemore.com.cn:9203/jeecms7/kjg/base/1.jhtml",
          //加载的URL
          withZoom: true,
          //允许缩放
          withLocalStorage: true,
          //本地缓存
          hidden: true,
          //默认状态隐藏
          initialChild: Container(
            color: Colors.white,
            child: Center(
              child: Text('Wiating...'),
            ),
          ), //设置初始化界面
        ),

        backgroundColor: Colors.white,
      ),
    );

  }
}


