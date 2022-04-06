// To parse this JSON data, do
//
//     final threeDModel = threeDModelFromJson(jsonString);


import 'dart:convert';

ThreeDModel threeDModelFromJson(String str) =>
    ThreeDModel.fromJson(json.decode(str));

String threeDModelToJson(ThreeDModel data) => json.encode(data.toJson());

class ThreeDModel {
  ThreeDModel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.odd,
    required this.createdAt,
    required this.updatedAt,
    required this.sections,
    required this.threed,
    required this.overallAmounts,
  });

  final int id;
  final String name;
  final int categoryId;
  final String odd;
  final String createdAt;
  final String updatedAt;
  final List<Section> sections;
  final List<Threed> threed;
  final List<OverallAmount> overallAmounts;

  factory ThreeDModel.fromJson(Map<String, dynamic> json) => ThreeDModel(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        odd: json["odd"],
        createdAt: json["created_at"]??"",
        updatedAt: json["updated_at"]??"",
        sections: List<Section>.from(
            json["sections"].map((x) => Section.fromJson(x))),
        threed:
            List<Threed>.from(json["threed"].map((x) => Threed.fromJson(x))),
        overallAmounts: List<OverallAmount>.from(json["overall_amounts"])
                .isEmpty
            ? []
            : List<OverallAmount>.from(
                json["overall_amounts"].map((x) => OverallAmount.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
        "odd": odd,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
        "threed": List<dynamic>.from(threed.map((x) => x.toJson())),
        "overall_amounts":
            List<dynamic>.from(overallAmounts.map((x) => x.toJson())),
      };
}

class OverallAmount {
  OverallAmount({
    required this.id,
    required this.amountLimit,
    required this.subCategoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String amountLimit;
  final int subCategoryId;
  final String createdAt;
  final String updatedAt;

  factory OverallAmount.fromJson(Map<String, dynamic> json) => OverallAmount(
        id: json["id"] ?? -1,
        amountLimit: json["amount_limit"] ?? "null",
        subCategoryId: json["sub_category_id"] ?? -1,
        createdAt: json["created_at"] ?? "null",
        updatedAt: json["updated_at"] ?? "null",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount_limit": amountLimit,
        "sub_category_id": subCategoryId,
        "created_at": createdAt,
        "updated_at": updatedAt
      };
}

class Section {
  Section({
    required this.id,
    required this.timeSection,
    required this.closeTime,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  final int id;
  final String timeSection;
  final dynamic closeTime;
  final String createdAt;
  final String updatedAt;
  final Pivot pivot;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        timeSection: json["time_section"],
        closeTime: json["close_time"]??"null",
        createdAt:json["created_at"]??"null",
        updatedAt: json["updated_at"]??"null",
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time_section": timeSection,
        "close_time": closeTime,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    required this.subCategoryId,
    required this.sectionId,
  });

  final int subCategoryId;
  final int sectionId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        subCategoryId: json["sub_category_id"],
        sectionId: json["section_id"],
      );

  Map<String, dynamic> toJson() => {
        "sub_category_id": subCategoryId,
        "section_id": sectionId,
      };
}

class Threed {
  Threed({
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
  });

  final int id;
  final String betNumber;
  final String hotAmountLimit;
  final String defaultAmount;
  final int subCategoryId;
  final int closeNumber;
  final String currentLimit;
  final dynamic createdAt;
  final dynamic updatedAt;
  final int status;

  factory Threed.fromJson(Map<String, dynamic> json) => Threed(
        id: json["id"],
        betNumber: json["bet_number"] ?? "null",
        hotAmountLimit: json["hot_amount_limit"] ?? "null",
        defaultAmount: json["default_amount"] ?? "null",
        subCategoryId: json["sub_category_id"] ?? "null",
        closeNumber: json["close_number"],
        currentLimit: json["current_limit"],
        createdAt: json["created_at"] ?? "null",
        updatedAt: json["updated_at"] ?? "null",
        status: json["status"],
      );

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
