// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.result,
    required this.status,
    required this.message,
     this.data,
     this.token,
  });

  final int result;
  final int status;
  final String message;
  final Data? data;
  final String? token;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    result: json["result"],
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]?? {}),
    token: json["token"]??"",
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "status": status,
    "message": message,
    "data": data?.toJson(),
    "token": token!,
  };
}

class Data {
  Data({
    required this.userId,
  });

  final int userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"]??-1,
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
  };
}
