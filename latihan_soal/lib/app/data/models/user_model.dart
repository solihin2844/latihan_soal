// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

class UserResponse {
  int? status;
  String? message;
  UserData? data;

  UserResponse({this.status, this.message, this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.iduser,
    this.userName,
    this.userEmail,
    this.userFoto,
    this.userAsalSekolah,
    this.dateCreate,
    this.jenjang = "SMA",
    this.userGender,
    this.userStatus = "verified",
    this.kelas,
  });

  int? iduser;
  String? userName;
  String? userEmail;
  String? userFoto;
  String? userAsalSekolah;
  DateTime? dateCreate;
  String? jenjang;
  String? userGender;
  String? userStatus;
  String? kelas;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        iduser: json["iduser"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userFoto: json["user_fhoto"],
        userAsalSekolah: json["user_asal_sekolah"],
        dateCreate: DateTime.parse(json["date_create"]),
        jenjang: json["jenjang"],
        userGender: json["user_gender"],
        userStatus: json["user_status"],
        kelas: json["kelas"],
      );

  Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "user_name": userName,
        "user_email": userEmail,
        "user_fhoto": userFoto,
        "user_asal_sekolah": userAsalSekolah,
        "date_create": dateCreate?.toIso8601String(),
        "jenjang": jenjang,
        "user_gender": userGender,
        "user_status": userStatus,
        "kelas": kelas,
      };
}
