// To parse this JSON data, do
//
//     final verifyOtpResponse = verifyOtpResponseFromJson(jsonString);

import 'dart:convert';

VerifyOtpResponse verifyOtpResponseFromJson(String str) => VerifyOtpResponse.fromJson(json.decode(str));

String verifyOtpResponseToJson(VerifyOtpResponse data) => json.encode(data.toJson());

class VerifyOtpResponse {
  String? statusCode;
  String? message;
  Content? content;

  VerifyOtpResponse({
    this.statusCode,
    this.message,
    this.content,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => VerifyOtpResponse(
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
