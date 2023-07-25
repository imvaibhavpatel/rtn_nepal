// To parse this JSON data, do
//
//     final newsList = newsListFromJson(jsonString);

import 'dart:convert';

NewsList newsListFromJson(String str) => NewsList.fromJson(json.decode(str));

String newsListToJson(NewsList data) => json.encode(data.toJson());

class NewsList {
  NewsList({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<NewsData>? data;

  factory NewsList.fromJson(Map<String, dynamic> json) => NewsList(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<NewsData>.from(
                json["data"]!.map((x) => NewsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NewsData {
  NewsData({
    this.id,
    this.title,
    this.meetingDate,
    this.description,
    this.banner,
    this.status,
    this.createdDatetime,
  });

  String? id;
  String? title;
  String? meetingDate;
  String? description;
  String? banner;
  String? status;
  String? createdDatetime;

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        id: json["id"],
        title: json["title"],
        meetingDate: json["meeting_date"],
        description: json["description"],
        banner: json["banner"],
        status: json["status"],
        createdDatetime: json["created_datetime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "meeting_date": meetingDate,
        "description": description,
        "banner": banner,
        "status": status,
        "created_datetime": createdDatetime,
      };
}
