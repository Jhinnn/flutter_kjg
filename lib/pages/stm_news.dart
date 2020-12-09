import 'package:flutter/material.dart';
import 'package:flutter_kpht/dao/new_dao.dart';
import 'package:flutter_kpht/model/news_model.dart';
import 'package:flutter_kpht/pages/stm_newsDetail.dart';


class StmNewsPage extends StatefulWidget {
  @override
  StmNewsState createState() => StmNewsState();
}

class StmNewsState extends State<StmNewsPage> {
  NewsModel newsModel;
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    loadNewsData();
  }


  //Column 网路请求
  Future<Null> loadNewsData() async {
    try {
      NewsDao.fetch().then((NewsModel datas) {
        setState(() {
          newsModel = datas;
          print('-=-=-=-=-=$newsModel');
        });
      }).catchError((e) {
        print(e);
      });
    } catch (e) {
      setState(() {
        print(e);
        setState(() {

        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('科技馆资讯',style: TextStyle(
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
        body: ListView.builder(
            itemCount: newsModel?.newsList?.length ?? 0,
            itemBuilder: (BuildContext context, int position) {
              return _item(position);
            }),
      ),
    );
  }

  _item(int position) {
    if (newsModel == null || newsModel.newsList == null) return null;
    NewsItem item = newsModel.newsList[position];
    return item.pic.length != 0 ? _picWidget(item) : _textWidget(item);
  }

  //带图片的资讯
  _picWidget(NewsItem item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StmNewsDetailPage(id: item.id)
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                  ),
                  Padding(padding: EdgeInsets.only(top: 30),),
                  Text(
                    item.time,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    maxLines: 2,
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
                image: NetworkImage(item.pic),
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }

  //不带图片的资讯
  _textWidget(NewsItem item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StmNewsDetailPage(id: item.id)
          ),
        );
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87,
                ),
                maxLines: 2,
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                item.time,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black26,
                ),
                maxLines: 2,
              ),
              Divider(thickness: 1.0,indent: 0.0,color: Color(0xffdbdbdb)),
            ],
          )
      ),
    );
  }
}


