import 'package:flutter/material.dart';
import 'package:flutter_kpht/dao/exhibitionItem_dao.dart';
import 'package:flutter_kpht/model/hallItem_model.dart';

class ExhibitionItemPage extends StatefulWidget {
  String roomId;
  ExhibitionItemPage({Key key, @required this.roomId}) : super(key: key);

  @override
  _ExhibitionItemState createState() => _ExhibitionItemState();
}

class _ExhibitionItemState extends State<ExhibitionItemPage> {
  HallItemModel hallItemModel;

  @override
  void initState() {
    super.initState();
    print(widget.roomId);
    loadExhibitionItemData(widget.roomId);
    print(widget.roomId);
  }

  //底部展厅Gird
  Widget _buildItemGridItme(HallItem item) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          child: Image(
            image: NetworkImage(item.imgs),
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
                item.title,
                textAlign: TextAlign.center,
              ),
            )
        )
      ],
    );
  }
  //底部展厅内容
  Widget _itemGirdContent(List<HallItem> item){
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemCount: item.length,
        shrinkWrap: true, 								//解决无限高度问题
        physics: new NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.4),
        itemBuilder: (BuildContext context, int index) {
          return _buildItemGridItme(hallItemModel.hallItemList[index]);
        });
  }

  //TabbarView内容
  Container buildContentView(HallItemModel hallItemModel) {
    if(hallItemModel == null) {
      return Container(color: Colors.white,);
    }else {
      return Container(
        child: ListView(
          children: [
            Container(
                height: 230,
                width: double.infinity,
                child: Image(
                  image: NetworkImage(hallItemModel.imgs),
                  fit: BoxFit.fill,
                )
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Center(
              child: Text(
                hallItemModel.name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Text(hallItemModel.desc,style: TextStyle(
                  fontSize: 17
              ),),
            ),
            _itemGirdContent(hallItemModel.hallItemList),
          ],
        ),
      );
    }

  }

  //TabbarView 请求内部数据
  //网络请求tabbar内部数据
  Future<Null> loadExhibitionItemData(String roomId) async {
    try {
      print('+++++$roomId');
      ExhibitionItemDao.fetch(roomId).then((HallItemModel datas) {
        setState(() {
          hallItemModel = datas;
          print(hallItemModel);
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
      body: buildContentView(hallItemModel),
    );
  }
}

