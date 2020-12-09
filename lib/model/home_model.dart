import 'package:flutter_kpht/model/activity_model.dart';
import 'package:flutter_kpht/model/item_model.dart';

class HomeModel {
  final List<ActivityModel> activityList;
  final List<ItemModel> itemList;

  HomeModel(
      {this.activityList, this.itemList});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var activityListJson = json['activityList'] as List;
    var itemListJson = json['item'] as List;

    List<ActivityModel> activitylList =
    activityListJson.map((i) => ActivityModel.fromJson(i)).toList();

    List<ItemModel> itemList =
    itemListJson.map((i) => ItemModel.fromJson(i)).toList();

    return HomeModel(
      activityList: activitylList,
      itemList: itemList,
    );
  }
}
