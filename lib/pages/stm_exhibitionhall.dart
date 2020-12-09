import 'package:flutter/material.dart';
import 'package:flutter_kpht/dao/exhibitionhall_dao.dart';
import 'package:flutter_kpht/model/exhibitionhall_model.dart';
import 'package:flutter_kpht/pages/stm_exhibitionItem.dart';

class ExhibitionHallPage extends StatefulWidget {
  @override
  _ExhibitionHallState createState() => _ExhibitionHallState();
}

class _ExhibitionHallState extends State<ExhibitionHallPage> with TickerProviderStateMixin {
  List<ExhibitionHallItem> _titleList = new List();
  TabController _tabController;
  ExhibitionHallModel exhibitionHallModel;
  bool hasTopLoad = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _titleList.length, vsync: this);
    loadExhibitionData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //初始化 Tabbar
  void initView(List<ExhibitionHallItem> list) {
    _tabController = TabController(length: _titleList.length, vsync: this);
    _tabController.addListener(() {
      // print(_tabController.index);
    });
  }


  //网络请求tabbar数据
  Future<Null> loadExhibitionData() async {
    try {
      ExhibitonHallDao.fetch().then((ExhibitionHallModel datas) {
        setState(() {
          exhibitionHallModel = datas;
          exhibitionHallModel.exhibitionHallList.forEach((element) {
            _titleList.add(element);
          });
          hasTopLoad = true;
          initView(_titleList);
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

  //TabBarView
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("展厅导览",style: TextStyle(color: Colors.black),),
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black87,)
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: _titleList.isEmpty ? <Widget>[] : _titleList.map((item) {
            return Tab(text: item.name);
          }).toList(),
          labelColor: Colors.red, //选中颜色
          labelStyle: TextStyle( //选中样式
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          unselectedLabelColor: Colors.black, //默认颜色
          unselectedLabelStyle: TextStyle( //未选中样式
              fontSize: 17,
              fontWeight: FontWeight.normal
          ),
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
          indicatorPadding: EdgeInsets.only(bottom: 1),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _titleList.isEmpty ? <Widget>[] : _titleList.map((item) {
          return ExhibitionItemPage(roomId: item.id);
        }).toList(),
      ),
    );
  }
}

