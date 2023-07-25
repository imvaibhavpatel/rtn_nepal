// To parse this JSON data, do
//
//     final tableName = tableNameFromJson(jsonString);

import 'dart:convert';

TableNameList tableNameFromJson(String str) =>
    TableNameList.fromJson(json.decode(str));

String tableNameToJson(TableNameList data) => json.encode(data.toJson());

class TableNameList {
  TableNameList({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<TableName>? data;

  factory TableNameList.fromJson(Map<String, dynamic> json) => TableNameList(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<TableName>.from(
                json["data"]!.map((x) => TableName.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TableName {
  TableName({
    this.id,
    this.tableName,
  });

  String? id;
  String? tableName;

  factory TableName.fromJson(Map<String, dynamic> json) => TableName(
        id: json["id"],
        tableName: json["table_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "table_name": tableName,
      };
}
