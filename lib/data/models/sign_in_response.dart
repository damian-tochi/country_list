// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';

SignInResponse signInResponseFromJson(String str) => SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  String? statusCode;
  String? message;
  Content? content;

  SignInResponse({
    this.statusCode,
    this.message,
    this.content,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
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
  String? token;
  AccountData? accountData;

  Content({
    this.email,
    this.hasVerifiedEmail,
    this.token,
    this.accountData,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    email: json["email"],
    hasVerifiedEmail: json["hasVerifiedEmail"],
    token: json["token"],
    accountData: json["accountData"] == null ? null : AccountData.fromJson(json["accountData"]),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "hasVerifiedEmail": hasVerifiedEmail,
    "token": token,
    "accountData": accountData?.toJson(),
  };
}

class AccountData {
  int? id;
  String? email;
  String? firstname;
  String? lastname;
  bool? isBusinessAccount;
  dynamic qrCode;
  dynamic bankAccountNumber;
  dynamic bankAccountName;
  dynamic bankName;
  dynamic bankCode;
  dynamic bankLogo;
  dynamic phoneNumber;
  dynamic registrationType;
  dynamic businessName;
  dynamic businessEmail;
  dynamic businessType;
  dynamic businessPhone;
  dynamic websiteUrl;
  dynamic linkedInUrl;
  dynamic facebookUrl;
  dynamic xUrl;
  bool? hasBankAccount;
  bool? hasVerifiedBusiness;
  bool? hasVerifiedTin;
  bool? hasVerifiedNin;

  AccountData({
    this.id,
    this.email,
    this.firstname,
    this.lastname,
    this.isBusinessAccount,
    this.qrCode,
    this.bankAccountNumber,
    this.bankAccountName,
    this.bankName,
    this.bankCode,
    this.bankLogo,
    this.phoneNumber,
    this.registrationType,
    this.businessName,
    this.businessEmail,
    this.businessType,
    this.businessPhone,
    this.websiteUrl,
    this.linkedInUrl,
    this.facebookUrl,
    this.xUrl,
    this.hasBankAccount,
    this.hasVerifiedBusiness,
    this.hasVerifiedTin,
    this.hasVerifiedNin,
  });

  factory AccountData.fromJson(Map<String, dynamic> json) => AccountData(
    id: json["id"],
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    isBusinessAccount: json["isBusinessAccount"],
    qrCode: json["qrCode"],
    bankAccountNumber: json["bankAccountNumber"],
    bankAccountName: json["bankAccountName"],
    bankName: json["bankName"],
    bankCode: json["bankCode"],
    bankLogo: json["bankLogo"],
    phoneNumber: json["phoneNumber"],
    registrationType: json["registrationType"],
    businessName: json["businessName"],
    businessEmail: json["businessEmail"],
    businessType: json["businessType"],
    businessPhone: json["businessPhone"],
    websiteUrl: json["websiteUrl"],
    linkedInUrl: json["linkedInUrl"],
    facebookUrl: json["facebookUrl"],
    xUrl: json["xUrl"],
    hasBankAccount: json["hasBankAccount"],
    hasVerifiedBusiness: json["hasVerifiedBusiness"],
    hasVerifiedTin: json["hasVerifiedTIN"],
    hasVerifiedNin: json["hasVerifiedNIN"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "isBusinessAccount": isBusinessAccount,
    "qrCode": qrCode,
    "bankAccountNumber": bankAccountNumber,
    "bankAccountName": bankAccountName,
    "bankName": bankName,
    "bankCode": bankCode,
    "bankLogo": bankLogo,
    "phoneNumber": phoneNumber,
    "registrationType": registrationType,
    "businessName": businessName,
    "businessEmail": businessEmail,
    "businessType": businessType,
    "businessPhone": businessPhone,
    "websiteUrl": websiteUrl,
    "linkedInUrl": linkedInUrl,
    "facebookUrl": facebookUrl,
    "xUrl": xUrl,
    "hasBankAccount": hasBankAccount,
    "hasVerifiedBusiness": hasVerifiedBusiness,
    "hasVerifiedTIN": hasVerifiedTin,
    "hasVerifiedNIN": hasVerifiedNin,
  };
}