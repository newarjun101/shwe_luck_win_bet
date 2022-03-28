// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.refeeralCode,
    required this.userCode,
    required this.balance,
    required this.profileImage,
  });

  final int id;
  final String name;
  final String phone;
  final dynamic refeeralCode;
  final String userCode;
  final String balance;
  final dynamic profileImage;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    refeeralCode: json["refeeral_code"],
    userCode: json["user_code"],
    balance: json["balance"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "refeeral_code": refeeralCode,
    "user_code": userCode,
    "balance": balance,
    "profile_image": profileImage,
  };
}
