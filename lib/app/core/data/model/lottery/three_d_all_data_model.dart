class ThreeDAllDataModel {
  int id;
  String betNumber;
  String hotAmountLimit;
  String defaultAmount;
  int subCategoryId;
  int closeNumber;
  String currentLimit;
  dynamic createdAt;
  String updatedAt;
  int status;
  bool isSelected;

  ThreeDAllDataModel(
      {required this.id,
      required this.betNumber,
      required this.hotAmountLimit,
      required this.defaultAmount,
      required this.subCategoryId,
      required this.closeNumber,
      required this.currentLimit,
      required this.createdAt,
      required this.updatedAt,
      required this.status,
      required this.isSelected});

  factory ThreeDAllDataModel.fromJson(Map<String, dynamic> json) => ThreeDAllDataModel(
    id: json["id"],
    betNumber: json["bet_number"],
    hotAmountLimit: json["hot_amount_limit"],
    defaultAmount: json["default_amount"],
    subCategoryId: json["sub_category_id"],
    closeNumber: json["close_number"],
    currentLimit: json["current_limit"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? "" :json["updated_at"],
    status: json["status"],
    isSelected: false
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
    "updated_at": updatedAt == null ? null : updatedAt,
    "status": status,
  };
}
