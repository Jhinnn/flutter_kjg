class ExhibitionHallModel {
  final List<ExhibitionHallItem> exhibitionHallList;

  ExhibitionHallModel({this.exhibitionHallList});

  factory ExhibitionHallModel.fromJson(Map<String, dynamic> json) {
    var dataJson = json['data'] as List;
    List<ExhibitionHallItem> datas =
    dataJson.map((i) => ExhibitionHallItem.fromJson(i)).toList();
    return ExhibitionHallModel(exhibitionHallList: datas);
  }

}

class ExhibitionHallItem {
  final String id;
  final String name;

  ExhibitionHallItem({this.id, this.name});

  factory ExhibitionHallItem.fromJson(Map<String, dynamic> json) {

    return ExhibitionHallItem(
      id: json['id'],
      name: json['name'],
    );
  }
}
