import 'dart:async';
import 'dart:convert';
import 'package:flutter_kpht/model/home_model.dart';
import 'package:flutter_kpht/const/const.dart';
import 'package:http/http.dart' as http;


//首页大接口
class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(BaseConst.Base_Url + 'getIndex.json');
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      print("------$result");
      return HomeModel.fromJson(result['data']);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}


