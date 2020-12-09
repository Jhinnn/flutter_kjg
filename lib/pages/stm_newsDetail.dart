import 'package:flutter/material.dart';
import 'package:flutter_kpht/func/func.dart';
import 'package:flutter_kpht/widget/share_diglog.dart';
import 'package:flutter_kpht/widget/sheet_dialog.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


// ignore: must_be_immutable
class StmNewsDetailPage extends StatelessWidget {
  // This widget is the root of your application.
  String id;
  StmNewsDetailPage({Key key, @required this.id}) : super(key: key);
  List<String> imagesList = ["imgs/umsocial_qq.png","imgs/umsocial_qzone.png","imgs/umsocial_sina.png","imgs/umsocial_wechat.png","imgs/umsocial_wechat_timeline.png","imgs/umsocial_wechat.png","imgs/umsocial_wechat_timeline.png"];
  List<String> textsList = ["qq","qq空间","新浪微博","微信","朋友圈","新浪微博","微信"];

  Widget ShareWrapWidget(BuildContext context) {
    return Wrap(
      spacing: 15,
      runSpacing: 10,
      children: shareWidget(context),
    );
  }

  List<Widget> shareWidget(BuildContext context) => List.generate(imagesList.length, (index) {
    String imagesPath = imagesList[index];
    String text = textsList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          child: CircleAvatar(
            backgroundImage: AssetImage(imagesPath),
          ),
          onTap: (){
            // _EntranceState()._entranceAction(context,i);
          },
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(),
        )
      ],
    );
  });

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
          title: Text('',style: TextStyle(
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
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                )
                // WebviewScaffold(
                //   url: "http://m.spacemore.com.cn:9203/jeecms7/kjg/$id.jhtml",
                //   //加载的URL
                //   withZoom: true,
                //   //允许缩放
                //   withLocalStorage: true,
                //   //本地缓存
                //   hidden: true,
                //   //默认状态隐藏
                //   initialChild: Container(
                //     color: Colors.white,
                //     child: Center(
                //       child: Text('Wiating...'),
                //     ),
                //   ), //设置初始化界面
                // ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: Icon(Icons.ios_share),
                          onPressed: () {
                            FunctionUtil.bottomSheetDialog(
                                context,
                                ShowSheetDialog(
                                  items: ['相册', '相机'],
                                  title: '请选择图片来源',
                                  onTap: (index) {

                                  },
                                )
                            );
                          }
                      ),
                      CollectionWidget(),
                      IconButton(
                          icon: Icon(Icons.assistant_direction),
                          onPressed: () {
                            FunctionUtil.bottomSheetDialog(
                              context,
                              ShowShareSheetDialog(
                                items: textsList,
                                imagePath: imagesList,
                                onTap: (index) {
                                  print("你点击了$index");
                                },
                              )
                            );
                          }
                          ),
                      ],
                  ),
                )
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}


//收藏按钮
class CollectionWidget extends StatefulWidget {
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<CollectionWidget> {
  bool _isCollection = false;

  void _collectionAction() {
    setState(() {
      if(_isCollection){
        _isCollection = false;
      }else {
        _isCollection = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: _isCollection ? Icon(Icons.star) : Icon(Icons.star_border), onPressed: _collectionAction,color: Colors.yellow,);
  }

}
