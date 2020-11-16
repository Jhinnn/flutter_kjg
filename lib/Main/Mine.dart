import 'package:flutter/material.dart';

class Mine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Row buildMenuColumn(String imagePath, String title) {
      return new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Container(
            margin: EdgeInsets.fromLTRB(35,10,0,5),
            child: new Image(
              width: 30,
              height: 30,
              image: AssetImage(imagePath),
            )
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(10,10,0,5),
            child: new Text(
              title,
              style: TextStyle(
                fontSize: 20,
                  fontWeight: FontWeight.w200,
                color: Colors.black
              ),
            ),
          )
        ],
      );
    }

    Widget menuWiget = new Container(
      child: new Column(
        children: [
          buildMenuColumn("imgs/huluobu.png", "火龙果"),
          Divider(height: 20.0,indent: 00.0,color: Color(0xff999999),thickness:10),
          buildMenuColumn("imgs/huluobu.png", "火龙果"),
          Divider(thickness: 1.0,indent: 75.0,color: Colors.grey,),
          buildMenuColumn("imgs/huluobu.png", "火龙果"),
          Divider(thickness: 1.0,indent: 75.0,color: Colors.grey,),
          buildMenuColumn("imgs/huluobu.png", "火龙果"),
          Divider(thickness: 1.0,indent: 75.0,color: Colors.grey,),
          buildMenuColumn("imgs/huluobu.png", "火龙果"),
          Divider(thickness: 10.0,indent: 0.0,color: Colors.grey,),
          buildMenuColumn("imgs/huluobu.png", "火龙果"),
        ],
      ),
    );

    Widget topWidget = new Container(
      // color: Colors.white,
      margin: EdgeInsets.fromLTRB(35, 0, 20, 0),
      height: 180,
      child: new Column(
        children: [
          new Container(
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.photo_camera,color: Colors.black,),
            )
          ),
          new Container(
            // color: Colors.yellow,
            margin: EdgeInsets.only(top: 40),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Image(
                  width: 80,
                  height: 80,
                  image: NetworkImage('https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2233854763,678386514&fm=11&gp=0.jpg'),
                  fit: BoxFit.fill,
                ),
                new Container(
                  margin: EdgeInsets.only(left: 20),
                  // color: Colors.red,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Container(
                        child: new Text(
                          '张三李四',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 6),
                        child: new Text(
                          '微信名：啦啦啦啦啦',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            color: Colors.black87,
                          ),
                        ),
                      )
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
      body: new ListView(
        children: [
          topWidget,
          Divider(height: 20.0,indent: 00.0,color: Color(0xff999999),thickness:10),
          menuWiget,
        ],
      )
    );
  }
}