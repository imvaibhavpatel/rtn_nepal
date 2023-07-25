// To parse this JSON data, do
//
//     final bloodGroup = bloodGroupFromJson(jsonString);

import 'dart:convert';

BloodGroup bloodGroupFromJson(String str) => BloodGroup.fromJson(json.decode(str));

String bloodGroupToJson(BloodGroup data) => json.encode(data.toJson());

class BloodGroup {
  BloodGroup({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<BloodGroupList>? data;

  factory BloodGroup.fromJson(Map<String, dynamic> json) => BloodGroup(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<BloodGroupList>.from(json["data"]!.map((x) => BloodGroupList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class BloodGroupList {
  BloodGroupList({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory BloodGroupList.fromJson(Map<String, dynamic> json) => BloodGroupList(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
