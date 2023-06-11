import 'Articles.dart';

class NewsModel {
  NewsModel({
      this.status, 
      this.totalResults, 
      this.articles,});

  NewsModel.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }
  String? status;
  int? totalResults;
  List<Articles>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}