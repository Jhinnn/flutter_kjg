import 'dart:async';
import 'dart:convert';
import 'package:flutter_kpht/model/exhibitionhall_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_kpht/const/const.dart';

//展厅
class ExhibitonHallDao {
  static Future<ExhibitionHallModel> fetch() async {
    final response = await http.get(BaseConst.Base_Url + 'getExhibitionArea.json');
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      print("------$result");
      return ExhibitionHallModel.fromJson(result);
    } else {
      throw Exception('Failed to load getNewsList.json');
    }
  }
}

