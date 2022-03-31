// To parse this JSON data, do
//
//     final twoDListModel = twoDListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TwoDListModel twoDListModelFromJson(String str) =>
    TwoDListModel.fromJson(json.decode(str));

String twoDListModelToJson(TwoDListModel data) => json.encode(data.toJson());

class TwoDListModel {
  TwoDListModel({
    required this.id,
    required this.betNumber,
    required this.hotAmountLimit,
    required this.defaultAmount,
    required this.subCategoryId,
    required this.closeNumber,
    required this.currentLimit,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.isSelected,
  });

  int id;
  String betNumber;
  String hotAmountLimit;
  String defaultAmount;
  int subCategoryId;
  int closeNumber;
  String currentLimit;
  dynamic createdAt;
  dynamic updatedAt;
  int status;
  bool isSelected;

  factory TwoDListModel.fromJson(Map<String, dynamic> json) => TwoDListModel(
      id: json["id"],
      betNumber: json["bet_number"],
      hotAmountLimit: json["hot_amount_limit"],
      defaultAmount: json["default_amount"],
      subCategoryId: json["sub_category_id"],
      closeNumber: json["close_number"],
      currentLimit: json["current_limit"],
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
      status: json["status"],
      isSelected: json["is_selected"] ?? false);

  Map<String, dynamic> toJson() => {
        "id": id,
        "bet_number": betNumber,
        "hot_amount_limit": hotAmountLimit,
        "default_amount": defaultAmount,
        "sub_category_id": subCategoryId,
        "close_number": closeNumber,
        "current_limit": currentLimit,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "status": status,
      };
}
