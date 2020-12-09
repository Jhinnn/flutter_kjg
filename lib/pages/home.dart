import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kpht/model/activity_model.dart';
import 'package:flutter_kpht/model/home_model.dart';
import 'package:flutter_kpht/dao/home_dao.dart';
import 'package:flutter_kpht/pages/stm_exhibitionhall.dart';
import 'package:flutter_kpht/pages/stm_introduce.dart';
import 'package:flutter_kpht/pages/stm_news.dart';
import 'package:flutter_kpht/widget/search_field.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_kpht/model/item_model.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  List<ActivityModel> activityList = [];
  List<ItemModel> itemList = [];
  List<String> swiperList = ['https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606217787496&di=516e8ee623fd3e16ad3b359654812402&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F55%2F22%2F20300000929429130630222900050.jpg','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606217787496&di=5a405119117b1e2cddc2b9e4e67e22fb&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F27%2F81%2F01200000194677136358818023076.jpg','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606217787496&di=be3214ce7835269e2f319bc35bce250b&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F45%2F84%2F01000000000000119078423790945_s.jpg','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606217787496&di=af3e931ea5721985cdceabd2836eef1e&imgtype=0&src=http%3A%2F%2Fimg.aiimg.com%2Fuploads%2Fuserup%2F0909%2F2Z64022L38.jpg'];
  List<String> iconsName = ['imgs/huluopu.png','imgs/juzi.png','imgs/niunai.png','imgs/shuihu.png','imgs/taiyang.png'];
  List<String> titlesName = ['科技馆介绍','科技馆资讯','科技馆活动','科技馆展厅','科技馆积分'];

  @override
  void initState() {
    super.initState();
    loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          // decoration: new BoxDecoration(
          //   border: Border.all(color: Colors.grey, width: 1.0), //灰色的一层边框
          //   color: Colors.white,
          //   borderRadius: BorderRadius.all( Radius.circular(5.0)),
          // ),
          alignment: Alignment.center,
          height: 38,
//           padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: JhTextField(
            leftWidget: Icon(Icons.search,color: Colors.grey,size: 20,),
            hintText: '请输入搜索内容：',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(19),
              borderSide: BorderSide(color: Colors.grey, width: 0.5, style: BorderStyle.solid),
            ),

          )
        ),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.playlist_play),
          //   tooltip: 'Air it',
          //   onPressed: null,
          // ),
          IconButton(
            icon: Icon(Icons.qr_code_scanner_sharp,color: Colors.grey,),
            tooltip: 'Restitch it',
            onPressed: null,
          ),
        ],
        leading: Container(
          padding: EdgeInsets.only(left: 10),
          width: 30,
          height: 30,
          child: Image(
            width: 30,
            height: 30,
            image: AssetImage('imgs/huluobu.png'),
          )
        ),
        // 左侧返回按钮，可以有按钮，可以有文字
        // flexibleSpace: Text('d12321312'),
        backgroundColor: Colors.white, //导航栏和状态栏的的颜色
        elevation: 0, //阴影的高度
        // bottom: PreferredSize(
        //     child: Text('bottom'),
        //     preferredSize: Size(30, 30)), // 在appbar下面显示的东西
        brightness: Brightness.light, //控制状态栏的颜色，lignt 文字是灰色的，dark是白色的
        iconTheme: IconThemeData(
            color: Colors.yellow,
            opacity: 0.5,
            size: 30), //icon的主题样式,默认的颜色是黑色的，不透明为1，size是24
        textTheme: TextTheme(), //这个主题的参数比较多,flutter定义了13种不同的字体样式
        centerTitle: true, //标题是否居中，默认为false
        toolbarOpacity: 0.5, //整个导航栏的不透明度
        bottomOpacity: 0.8, //bottom的不透明度
        titleSpacing: 10, //标题两边的空白区域,
      ),
      body: _body(context)
    );
  }

  Widget _body(context) {
      return ListView(
        children: <Widget>[
          _swiper(),
          _entrance(context),
          Divider(thickness: 10.0,indent: 0.0,color: Color(0xffdbdbdb)),
          _activityListHeader(),
          Expanded(child: _activityListContent()),
          _activityListHeader(),
          _itemGirdContent(),
        ],
      );
  }

  Widget _buildActivityListItem(int index) {
    ActivityModel activityModel = activityList[index];
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 15),
      // padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: ShapeDecoration(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))
                ),
                alignment: Alignment.center,
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                child: Text(
                  activityModel.title,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              )

            ],
          ),
          Padding(padding: EdgeInsets.only(left: 20)),
          Divider(thickness: 1.0,indent: 12.0,color: Color(0xffdbdbdb)),
        ],
      ),
    );
  }

  Widget _buildItemGridItme(int index) {
    ItemModel itemModel = itemList[index];
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          child: Image(
            image: NetworkImage(itemModel.imgs),
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            height: 30,
            color: Color.fromRGBO(230, 230, 230, 0.5),
            child: Text(
              itemModel.title,
              textAlign: TextAlign.center,
            ),
          )
        )
      ],
    );
  }

  //Column 1  轮播图
  //轮播图
  Widget _swiper() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 240.0,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              swiperList[index],
              fit: BoxFit.fill,
            );
          },
          itemCount: swiperList.length,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
              )),
          control: new SwiperControl(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('点击了第$index个'),

        ));
  }
  Widget _swiperBuilder(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(swiperList[index]),fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  //Column 2入口 循环创建组件
  Widget _buildEntranceItem(BuildContext context){
    List<Widget> entranceItmes = [];//先建一个数组用于存放循环生成的widget
    Widget content;
    for(int i = 0; i < 5; i ++) {
      String iconPath = iconsName[i];
      String titleName = titlesName[i];
      entranceItmes.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: CircleAvatar(
                  backgroundImage: AssetImage(iconPath),
                ),
                onTap: (){
                  _EntranceState()._entranceAction(context,i);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                titleName,
                textAlign: TextAlign.center,
                style: TextStyle(),
              )
            ],
          )
      );
    }
    content = new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: entranceItmes //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
        //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
        );
    return content;
  }
  Widget _entrance(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(top: 20),
      child: _buildEntranceItem(context),
    );
  }

  //Column 4 最新活动Header
  Widget _activityListHeader(){
    return Container(
      height: 50,
      padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
            width: 5,
            height: 22,
            decoration: ShapeDecoration(
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Container(
            child: Text(
              '最新活动',
              style: TextStyle(
                  fontSize: 18
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Column 5 最新活动内容
  Widget _activityListContent(){
    return ListView.builder(
      itemCount: activityList.length,
      shrinkWrap: true, 								//解决无限高度问题
      physics: new NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index){
        return Expanded(child: _buildActivityListItem(index));
      },
    );
  }

  //Colunm 6 展项内容
  Widget _itemGirdContent(){
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15),
      itemCount: itemList.length,
      shrinkWrap: true, 								//解决无限高度问题
      physics: new NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 1.4),
      itemBuilder: (BuildContext context, int index) {
        return _buildItemGridItme(index);
      });
  }

  //Column 网路请求
  Future<Null> loadHomeData() async {
    try {
      HomeDao.fetch().then((HomeModel model) {
        setState(() {
          activityList = model.activityList;
          itemList = model.itemList;
          print('-=-=-=-=-=$itemList');
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
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

// 新添加事件，页面跳转
class Entrance extends StatefulWidget{
  @override
  _EntranceState createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> {
  void _entranceAction(BuildContext context, int index,){
    switch(index) {
      case 0:
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new StmIntroducePage(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new StmNewsPage(),
          ),
        );
        break;
      case 2:
        break;
      case 3:
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new ExhibitionHallPage(),
          ),
        );

        break;
      case 4:
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

