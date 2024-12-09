// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  String? statusCode;
  String? message;
  Content? content;

  SignUpResponse({
    this.statusCode,
    this.message,
    this.content,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    statusCode: json["statusCode"],
    message: json["message"],
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "content": content?.toJson(),
  };
}

class Content {
  String? email;
  bool? hasVerifiedEmail;

  Content({
    this.email,
    this.hasVerifiedEmail,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    email: json["email"],
    hasVerifiedEmail: json["hasVerifiedEmail"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "hasVerifiedEmail": hasVerifiedEmail,
  };
}
