class ActivityModel {
  final String title;
  final String imgs;
  final String stratDate;
  final String endDate;

  ActivityModel({this.title, this.imgs, this.stratDate, this.endDate});

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      title: json['title'],
      imgs: json['imgs'],
      stratDate: json['stratDate'],
      endDate: json['endDate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['imgs'] = this.imgs;
    data['stratDate'] = this.stratDate;
    data['endDate'] = this.endDate;
    return data;
  }


}
