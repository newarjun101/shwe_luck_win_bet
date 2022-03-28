import 'dart:convert';

List<PaymentTypeModel> paymentTypeModelFromJson(String str) =>
    List<PaymentTypeModel>.from(
        json.decode(str).map((x) => PaymentTypeModel.fromJson(x)));

String paymentTypeModelToJson(List<PaymentTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentTypeModel {
  PaymentTypeModel({
    required this.id,
    required this.name,
    required this.holderName,
    required this.accountNumber,
    required this.logo,
    required this.status,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String holderName;
  final String accountNumber;
  final String logo;
  final int status;
  final String type;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory PaymentTypeModel.fromJson(Map<String, dynamic> json) =>
      PaymentTypeModel(
        id: json["id"],
        name: json["name"],
        holderName: json["holder_name"],
        accountNumber: json["account_number"],
        logo: json["logo"],
        status: json["status"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "holder_name": holderName,
        "account_number": accountNumber,
        "logo": logo,
        "status": status,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
