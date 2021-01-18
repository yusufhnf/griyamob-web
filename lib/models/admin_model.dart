// To parse this JSON data, do
//
//     final adminModel = adminModelFromJson(jsonString);

import 'dart:convert';

AdminModel adminModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

String adminModelToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
  AdminModel({
    this.status,
    this.body,
  });

  int status;
  List<Body> body;

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        status: json["status"] == null ? null : json["status"],
        body: json["body"] == null
            ? null
            : List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "body": body == null
            ? null
            : List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class Body {
  Body({
    this.email,
    this.fullname,
    this.position,
  });

  String email;
  String fullname;
  String position;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        email: json["email"] == null ? null : json["email"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        position: json["position"] == null ? null : json["position"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "fullname": fullname == null ? null : fullname,
        "position": position == null ? null : position,
      };
}
