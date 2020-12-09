class NewsModel {
  final List<NewsItem> newsList;

  NewsModel({this.newsList});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    var dataJson = json['data'] as List;
    List<NewsItem> datas =
    dataJson.map((i) => NewsItem.fromJson(i)).toList();
    return NewsModel(newsList: datas);
  }

}

class NewsItem {
  final String id;
  final String pic;
  final String title;
  final String time;

  NewsItem({this.id, this.pic, this.title, this.time});

  factory NewsItem.fromJson(Map<String, dynamic> json) {

    return NewsItem(
      id: json['id'],
      pic: json['pic'],
      title: json['title'],
      time: json['time'],
    );
  }
}
