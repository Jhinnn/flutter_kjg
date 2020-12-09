class HallItemModel {
  final List<HallItem> hallItemList;
  final String name;
  final String imgs;
  final String desc;

  HallItemModel({this.hallItemList, this.name, this.imgs, this.desc});

  factory HallItemModel.fromJson(Map<String, dynamic> json) {
    var dataJson = json['data']['item'] as List;
    String name = json['data']['name'];
    String imgs = json['data']['imgs'];
    String desc = json['data']['desc'];
    List<HallItem> datas =
    dataJson.map((i) => HallItem.fromJson(i)).toList();
    return HallItemModel(hallItemList: datas, name: name, imgs: imgs, desc: desc);
  }

}

class HallItem {
  final String id;
  final String title;
  final String imgs;

  HallItem({this.id, this.title, this.imgs});

  factory HallItem.fromJson(Map<String, dynamic> json) {

    return HallItem(
      id: json['id'],
      title: json['title'],
      imgs: json['imgs'],
    );
  }
}
