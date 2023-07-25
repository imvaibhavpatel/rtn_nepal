// To parse this JSON data, do
//
//     final memberList = memberListFromJson(jsonString);

import 'dart:convert';

MemberList memberListFromJson(String str) =>
    MemberList.fromJson(json.decode(str));

String memberListToJson(MemberList data) => json.encode(data.toJson());

class MemberList {
  MemberList({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<MemberDataList>? data;

  factory MemberList.fromJson(Map<String, dynamic> json) => MemberList(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<MemberDataList>.from(
                json["data"]!.map((x) => MemberDataList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MemberDataList {
  MemberDataList({
    this.id,
    this.profileImage,
    this.memberName,
    this.email,
    this.tableId,
    this.tableName,
    this.homeAddress,
    this.workAddress,
    this.mobileNumber,
    this.phoneNumber,
    this.dob,
    this.marriageAniversaryDate,
    this.age,
    this.status,
  });

  String? id;
  String? profileImage;
  String? memberName;
  String? email;
  String? tableId;
  String? tableName;
  String? homeAddress;
  String? workAddress;
  String? mobileNumber;
  String? phoneNumber;
  String? dob;
  String? marriageAniversaryDate;
  String? age;
  String? status;

  factory MemberDataList.fromJson(Map<String, dynamic> json) => MemberDataList(
        id: json["id"],
        profileImage: json["profile_image"],
        memberName: json["member_name"],
        email: json["email"],
        tableId: json["table_id"],
        tableName: json["table_name"],
        homeAddress: json["home_address"],
        workAddress: json["work_address"],
        mobileNumber: json["mobile_number"],
        phoneNumber: json["phone_number"],
        dob: json["dob"],
        marriageAniversaryDate: json["marriage_aniversary_date"],
        age: json["age"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profile_image": profileImage,
        "member_name": memberName,
        "email": email,
        "table_id": tableId,
        "table_name": tableName,
        "home_address": homeAddress,
        "work_address": workAddress,
        "mobile_number": mobileNumber,
        "phone_number": phoneNumber,
        "dob": dob,
        "marriage_aniversary_date": marriageAniversaryDate,
        "age": age,
        "status": status,
      };
}
