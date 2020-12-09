import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Column buildMenuColumn(String imagePath, String title) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //color: Colors.red,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      width: 26,
                      height: 26,
                      image: AssetImage(imagePath),
                    ),
                    Padding(padding: EdgeInsets.only(right: 15),),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 17,
                        color: Colors.black45
                      ),
                    )
                  ],
                ),
                Image(
                  image: AssetImage('imgs/arrow_right.png'),
                  width:20,
                  height: 16,
                ),
              ],
            ),
          ),
          Divider(thickness: 1.0,indent: 60.0,color: Color(0xffdbdbdb)),
        ],

      );
    }

    Widget menuWiget = new Container(
      child: new Column(
        children: [
          buildMenuColumn("imgs/huluobu.png", "火龙果"),
          buildMenuColumn("imgs/juzi.png", "橘子"),
          buildMenuColumn("imgs/niunai.png", "牛奶"),
          buildMenuColumn("imgs/shuihu.png", "水壶"),
          buildMenuColumn("imgs/taiyang.png", "太阳"),
        ],
      ),
    );

    Widget topWidget = new Container(
      // color: Colors.red,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.only(top: 44),),
          new Container(
            padding: EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.photo_camera,color: Colors.black,),
            )
          ),
          new Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            // color: Colors.green,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(4)),
                      clipBehavior: Clip.antiAlias,
                      child: Image(
                        image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605611056094&di=b8a24190af08a4f98b832dbf7e48b48b&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F30%2F29%2F01300000201438121627296084016.jpg'),
                        width: 70,
                        height: 70,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '张三李四',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Text(
                          '微信名：啦啦啦',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            color: Color(0xFF8a8a8a),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage('imgs/code.png'),
                        width:20,
                        height: 16,
                      ),
                      Padding(padding: EdgeInsets.only(right: 18),),
                      Image(
                        image: AssetImage('imgs/arrow_right.png'),
                        width:18,
                        height: 14,
                      ),
                    ],
                  )
                )
              ],
            ),
          ),

        ],

      )
    );

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('个人中心'),
      // ),
      body: ListView(
        children: [
          topWidget,
          Divider(thickness: 10.0,indent: 0.0,color: Color(0xffdbdbdb)),
          menuWiget,
        ],
      ),
    );
  }
}

