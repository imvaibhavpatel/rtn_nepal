import 'dart:convert';

NewsUpdateModel newsUpdateModelFromJson(String str) =>
    NewsUpdateModel.fromJson(json.decode(str));

String newsUpdateModelToJson(NewsUpdateModel data) =>
    json.encode(data.toJson());

class NewsUpdateModel {
  NewsUpdateModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<News>? data;

  factory NewsUpdateModel.fromJson(Map<String, dynamic> json) =>
      NewsUpdateModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<News>.from(json["data"]!.map((x) => News.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class News {
  News({
    this.id,
    this.title,
    this.description,
    this.banner,
    this.createdDatetime,
  });

  String? id;
  String? title;
  String? description;
  String? banner;
  String? createdDatetime;

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        banner: json["banner"],
        createdDatetime: json["created_datetime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "banner": banner,
        "created_datetime": createdDatetime,
      };
}
