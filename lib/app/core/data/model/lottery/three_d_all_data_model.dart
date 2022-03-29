class ThreeDAllDataModel {
  final int id;
  final String betNumber;
  final String hotAmountLimit;
  final String defaultAmount;
  final int subCategoryId;
  final int closeNumber;
  final String currentLimit;
  final dynamic createdAt;
  final String updatedAt;
  final int status;
  final bool isSelected;

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
}
