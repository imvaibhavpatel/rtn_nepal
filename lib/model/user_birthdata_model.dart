// To parse this JSON data, do
//
//     final upcomingBirthdataModel = upcomingBirthdataModelFromJson(jsonString);

import 'dart:convert';

UpcomingBirthdataModel upcomingBirthdataModelFromJson(String str) =>
    UpcomingBirthdataModel.fromJson(json.decode(str));

String upcomingBirthdataModelToJson(UpcomingBirthdataModel data) =>
    json.encode(data.toJson());

class UpcomingBirthdataModel {
  UpcomingBirthdataModel({
    this.status,
    this.message,
    this.birthData,
  });

  String? status;
  String? message;
  List<UserBirthData>? birthData;

  factory UpcomingBirthdataModel.fromJson(Map<String, dynamic> json) =>
      UpcomingBirthdataModel(
        status: json["status"],
        message: json["message"],
        birthData: json["data"] == null
            ? []
            : List<UserBirthData>.from(
                json["data"]!.map((x) => UserBirthData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": birthData == null
            ? []
            : List<dynamic>.from(birthData!.map((x) => x.toJson())),
      };
}

class UserBirthData {
  UserBirthData({
    this.id,
    this.profileImage,
    this.name,
    this.age,
    this.tableAbbrName,
    this.dob,
  });

  String? id;
  String? profileImage;
  String? name;
  String? age;
  String? tableAbbrName;
  String? dob;

  factory UserBirthData.fromJson(Map<String, dynamic> json) => UserBirthData(
        id: json["id"],
        profileImage: json["profile_image"],
        name: json["name"],
        age: json["age"],
        tableAbbrName: json["table_abbr_name"],
        dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profile_image": profileImage,
        "name": name,
        "age": age,
        "table_abbr_name": tableAbbrName,
        "dob": dob,
      };
}
