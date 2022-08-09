// To parse this JSON data, do
//
//     final erqaResponse = erqaResponseFromJson(jsonString);

import 'dart:convert';

ErqaResponse erqaResponseFromJson(String str) => ErqaResponse.fromJson(json.decode(str));

String erqaResponseToJson(ErqaResponse data) => json.encode(data.toJson());


///This class is generated from website, Please try to do it yourself.
class ErqaResponse {
    ErqaResponse({
        this.message,
        this.role,
        this.email,
        this.username,
        this.accessToken,
    });

    final String? message;
    final String? role;
    final String? email;
    final String? username;
    final String? accessToken;

/// function that converts Json from Map<String, dynamic> to Object of ErqaResponse.
    factory ErqaResponse.fromJson(Map<String, dynamic> json) => ErqaResponse(
        message: json["message"],
        role: json["role"],
        email: json["email"],
        username: json["username"],
        accessToken: json["access_token"]
    );

    Map<String, dynamic> toJson() =>
     {
        "message": message,
        "role": role,
        "email": email,
        "username": username,
        "access_token": accessToken,
    };
}
