import 'dart:async';
import 'dart:convert';
import 'package:flutter_kpht/model/hallItem_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_kpht/const/const.dart';

//展厅列表接口
class HallItemDao {
  static Future<HallItemModel> fetch(String id) async {
    Map paramsMap = {id: id};
    final response = await http.post(BaseConst.Base_Url + 'getExhibitionAreaById.json',body: jsonEncode(paramsMap));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      print("------$result");
      return HallItemModel.fromJson(result);
    } else {
      throw Exception('Failed to load getNewsList.json');
    }
  }
}

