import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget firstStyleWidget = new Container(
      //color: Colors.red,
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '一定要确保设备已经获取了用户权限-SD卡的读写权限',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.34,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 8),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '会拉伸填充满显示空间，图片本身长宽比会发生变化',
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                    ),
                    Padding(padding: EdgeInsets.only(top: 30),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.remove_red_eye,size: 16,),
                            Padding(padding: EdgeInsets.only(left: 5),),
                            Text(
                              '10',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(left: 10),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.commute,size: 16,),
                            Padding(padding: EdgeInsets.only(left: 5),),
                            Text(
                              '12',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                flex: 1,
                // color: Colors.green,
                child: Image(
                  height: 90,
                  image: NetworkImage('https://pics6.baidu.com/feed/f31fbe096b63f624bd212885347271ff1b4ca3f2.jpeg?token=550ddf051771c49b5b5bac5ac070cc9b'),
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 8),),
          Divider(thickness: 1.0,indent: 0.0,color: Color(0xffdbdbdb)),
        ],
      ),
    );
    Widget secondStyleWidget = new Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text(
                    '当地时间17日，美国参议院临时议长、87岁的格拉斯利宣布自己的新冠检测结果呈阳性',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                    ),
                    maxLines: 3,
                  ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '热议',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 12),),
                          Text(
                            '手机中国',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF969696),
                              fontSize: 12,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 12),),
                          Text(
                            '1.9万跟帖',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF969696),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.close,size: 20,color: Color(0xFF969696),),
                    ],
                  )
                ],
              ),
            )
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
              flex: 1,
              child: Container(
                height: 110,
                color: Colors.yellow,
                child: Image(
                  image: NetworkImage('https://pics5.baidu.com/feed/d8f9d72a6059252d3e7bebb53d95983c5bb5b92d.jpeg?token=71efffcb9c78fa731b5f97d708028361'),
                  height: 100,
                  fit: BoxFit.fill,
                ),
              )
          ),
        ],
      ),
    );
    Widget thridStyleWidget = new Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '暴雪预警升级为橙色！五省区有大到暴雪！局地新增雨量量超过35毫米',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.black87,
            ),
            maxLines: 2,
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605679651879&di=38502aa2f6a3d88763af430a0199abf9&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201201%2F21%2F20120121154411_GkYvQ.thumb.700_0.jpg'),
                  fit: BoxFit.fill,
                  height: 98,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 7)),
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605679651878&di=7d49e6b683a81d518e938f7720294534&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Ftech%2Fpics%2Fhv1%2F45%2F193%2F1023%2F66569835.jpg'),
                  fit: BoxFit.fill,
                  height: 98,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 7)),
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage('https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2726981702,1324057644&fm=26&gp=0.jpg'),
                  fit: BoxFit.fill,
                  height: 98,
                ),
              ),


            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '头条',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 12),),
                  Text(
                    '中国气象',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF969696),
                      fontSize: 12,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 12),),
                  Text(
                    '9.9万跟帖',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF969696),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Icon(Icons.close,size: 20,color: Color(0xFF969696),),
            ],
          ),
          Divider(thickness: 1.0,indent: 0.0,color: Color(0xffdbdbdb)),
        ],
      )
    );
    Widget fourStyleWidget = new Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '离婚大战再曝进展：张培萌妻子谈产后第17天被家暴',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
              maxLines: 2,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              height: 220,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2127131318,41737072&fm=11&gp=0.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        // color: Colors.red,
                        child: Center(
                          child: Icon(Icons.play_arrow_outlined,size: 35,color: Colors.white,),
                        ),
                      ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        '02:22',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '中国气象',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF969696),
                        fontSize: 12,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 12),),
                    Text(
                      '9.9万跟帖',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF969696),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.close,size: 20,color: Color(0xFF969696),),
              ],
            ),
            Divider(thickness: 1.0,indent: 0.0,color: Color(0xffdbdbdb)),
          ],
        )
    );
    Widget fiveStyleWidget = new Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(child: Image(
                      image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605702007612&di=1f463327fb1aa26930b72fe27f0634a3&imgtype=0&src=http%3A%2F%2Fp.qpic.cn%2Fwenwenpic%2F0%2F20190425162855-357078740%2F0'),
                      width: 34,
                      height: 34,
                      fit: BoxFit.fill,
                    )), //剪裁为圆形
                    Padding(padding: EdgeInsets.only(left: 8),),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '每日财经',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 2)),
                          Text(
                            '网易财经创作作者',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black26,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  // color: Colors.black,
                  width: 60,
                  height: 30,
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      print('登陆');
                    },
                    child: Text('关注',style: TextStyle(fontSize: 13.0,color: Colors.white),),
                    ///圆角
                    shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                  ),
                )
              ],

            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            '层叠布局和Web中的绝对定位、Android中的Frame布局是相似的，子组件可以根据距父容器四个角的位置来确定自身的位置',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 17,
              color: Colors.black87,
            ),
            maxLines: 2,
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Image(image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605703099623&di=2b4bb8ef9391746a718c381dd07f7b1a&imgtype=0&src=http%3A%2F%2Fa4.att.hudong.com%2F34%2F02%2F01200000023973136325023926706.jpg'),height: 220,fit: BoxFit.fill,),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            '中国美食',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Color(0xFF969696),
              fontSize: 12,
            ),
          ),
          Divider(thickness: 1.0,indent: 0.0,color: Color(0xffdbdbdb)),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: ListView(
        children: [
          // firstStyleWidget,
          // secondStyleWidget,
          // Divider(thickness: 1.0,indent: 12.0,color: Color(0xffdbdbdb)),
          // thridStyleWidget,
          // fourStyleWidget,
          // fiveStyleWidget,
        ],
      )
    );
  }

}