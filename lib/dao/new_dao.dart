import 'dart:async';
import 'dart:convert';
import 'package:flutter_kpht/model/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_kpht/const/const.dart';

//资讯列表接口
class NewsDao {
  static Future<NewsModel> fetch() async {
    final response = await http.get(BaseConst.Base_Url + 'getNewsList.json');
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      print("------$result");
      return NewsModel.fromJson(result);
    } else {
      throw Exception('Failed to load getNewsList.json');
    }
  }
}

