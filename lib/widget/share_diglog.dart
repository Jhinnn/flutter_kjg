import 'package:flutter/material.dart';

class ShowShareSheetDialog extends StatefulWidget {
  //按钮title
  List<String> items = [];
  List<String> imagePath = [];
  //点击事件回调 0开始
  Function onTap;

  ShowShareSheetDialog({
    @required this.items,
    @required this.imagePath,
    this.onTap,
  });

  @override
  _ShowShareSheetDialogState createState() => _ShowShareSheetDialogState();
}

class _ShowShareSheetDialogState extends State<ShowShareSheetDialog> {

  Widget getItemContainer(String imagePath, String text) {
    int index = widget.items.indexOf(text);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: CircleAvatar(
              backgroundImage: AssetImage(imagePath),
            ),
            onTap: (){
              if(widget.onTap != null){
                widget.onTap(index);
              }
            },
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      // height: ,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
                crossAxisCount: 5,
                //纵轴间距
                mainAxisSpacing: 10.0,
                //横轴间距
                crossAxisSpacing: 10.0,
                //子组件宽高长度比例
                childAspectRatio: 1.0
            ),
            shrinkWrap: true,
            //解决无限高度问题
            itemBuilder: (BuildContext context, int index) {
              return getItemContainer(widget.imagePath[index],widget.items[index]);
            },
            itemCount: widget.items.length,
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: _itemCreat('取消'),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],

      )
    );
  }

  Widget _itemCreat(String title) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(color: Colors.white24, width: 1)),
      ),
    );
  }
}
