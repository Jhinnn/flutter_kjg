class ItemModel {
  final String title;
  final String imgs;
  final String desc;
  final String areaName;
  final String id;

  ItemModel({this.title, this.imgs, this.desc, this.areaName, this.id});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      title: json['title'],
      imgs: json['imgs'],
      desc: json['desc'],
      areaName: json['areaName'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['imgs'] = this.imgs;
    data['desc'] = this.desc;
    data['areaName'] = this.areaName;
    data['id'] = this.id;
    return data;
  }


}
