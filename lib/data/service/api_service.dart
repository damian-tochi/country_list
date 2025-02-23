import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppApi {

  final client = Dio();
  static const baseUrl = "https://metropay-api.ourfutur.com/api/v1";
  var headerFree = {"content-type": "application/json"};

  ///Auth APIs *
  Future<Response> signUpNewUser(fName, lName, email, pass) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "firstname": fName,
      "lastname": lName,
      "email": email,
      "password": pass
    };
    final response = await client.post('$baseUrl/auth/signup', data: data, options:Options(
      headers: headerFree,),);
    return response;
  }

  Future<Response> signInEmail(email, pass) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      'email': email,
      'password': pass,
    };
    final response = await client.post(
        '$baseUrl/auth/login',
        data: data, options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> logout() async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    final response = await client.get('$baseUrl/auth/logout', options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> serverRequestEmailOTP(email) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      'email': email,
    };
    final response = await client.post('$baseUrl/auth/resend-signup-otp', data: data, options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> serverVerifyEmailOTP(email, otp) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      'email': email,
      'otp': otp,
    };
    final response = await client.post('$baseUrl/auth/verify-signup-email', data: data, options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> resetPassOTP(email) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      'email': email,
    };
    final response = await client.post('$baseUrl/auth/initiate-password-reset', data: data, options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> resetPassOTPResend(email) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      'email': email,
    };
    final response = await client.post('$baseUrl/auth/resend-reset-otp', data: data, options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> confirmResetPassEmail(email, otp) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      'email': email,
      'otp': otp
    };
    final response = await client.post('$baseUrl/auth/confirm-reset-email', data: data, options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> resetPasswordRequest(email, otp, password) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "resetToken": otp,
      "email": email,
      "password": password
    };
    final response = await client.post(
        '$baseUrl/auth/complete-password-reset', data: data, options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? globalString = prefs.getString("Token");
    var header = {HttpHeaders.authorizationHeader: 'Bearer $globalString',  "content-type": "application/json"};

    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    final response = await client.get('$baseUrl/auth/current-user', options: Options(headers: header));
    return response;
  }

  Future<Response> logoutUser() async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    final response = await client.get(
        '$baseUrl/auth/logout', options: Options(
      headers: headerFree,));
    return response;
  }

  //Account flow
  Future<Response> createBusinessAcc(businessName, businessEmail, businessType, businessPhone) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "businessName": businessName,
      "businessEmail": businessEmail,
      "businessType": businessType,
      "businessPhone": businessPhone
    };
    final response = await client.post(
        '$baseUrl/accounts/setup-business', data: data, options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> getBusinessAcc(businessId) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    final response = await client.get(
        '$baseUrl/accounts/$businessId', options: Options(
      headers: headerFree,));
    return response;
  }


  Future<Response> putBusinessAcc(businessId) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    final response = await client.put(
        '$baseUrl/accounts/$businessId', options: Options(
      headers: headerFree,));
    return response;
  }



  //Banking Config
  Future<Response> createAccTransactionPin(transactionPin) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "transactionPin": transactionPin,
    };
    final response = await client.post(
        '$baseUrl/banking/config/pin/create', data: data, options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> verifyAccTransactionPin(transactionPin) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "transactionPin": transactionPin,
    };
    final response = await client.post(
        '$baseUrl/banking/config/pin/verify', data: data, options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> createAccBiometric(biometricId) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "biometricId": biometricId,
    };
    final response = await client.post(
        '$baseUrl/banking/config/biometric/create', data: data, options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> verifyAccBiometric(biometricId) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "biometricId": biometricId,
    };
    final response = await client.post(
        '$baseUrl/banking/config/biometric/verify', data: data, options: Options(
      headers: headerFree,));
    return response;
  }


  Future<Response> initTransactionPinChange() async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    final response = await client.get(
        '$baseUrl/banking/config/pin/initialize-change', options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> updateTransactionPinToken(token, newPin) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "token": token,
      "newPin": newPin
    };
    final response = await client.put(
        '$baseUrl/banking/config/pin/update/token', data: data, options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> updateExistingTransactionPin(existingPin, newPin) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "existingPin": existingPin,
      "newPin": newPin
    };
    final response = await client.put(
        '$baseUrl/banking/config/pin/update/existing-pin', data: data, options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> updateBiometric(faceIdData, newPin) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "faceIdData": faceIdData,
      "newPin": newPin
    };
    final response = await client.put(
        '$baseUrl/banking/config/pin/update/biometric', data: data, options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> updateAccTransactionLimit(limit, transactionPin, biometricId) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "limit": limit,
      "transactionPin": transactionPin,
      "biometricId": biometricId
    };
    final response = await client.put(
        '$baseUrl/banking/config/limit/update', data: data, options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> updateTransactionApprovalMethod(method, transactionPin, biometricId) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "method": method,
      "transactionPin": transactionPin,
      "biometricId": biometricId
    };
    final response = await client.put(
        '$baseUrl/banking/config/approval-method/update', data: data, options: Options(
      headers: headerFree,));
    return response;
  }


  //Recipients Config
  Future<Response> createRecipients(bankName, bankCode, accountNumber, accountName, bankLogo) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "bankName": bankName,
      "bankCode": bankCode,
      "accountNumber": accountNumber,
      "accountName": accountName,
      "bankLogo": bankLogo
    };
    final response = await client.post(
        '$baseUrl/banking/recipients', data: data, options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> getAllRecipients() async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    final response = await client.get(
        '$baseUrl/banking/recipients', options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> getARecipient(id) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    final response = await client.get(
        '$baseUrl/banking/recipients/$id', options: Options(
      headers: headerFree,));
    return response;
  }


  Future<Response> deleteARecipient(id) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    final response = await client.delete(
        '$baseUrl/banking/recipients/$id', options: Options(
      headers: headerFree,));
    return response;
  }


  //BBanking Accounts Config
  Future<Response> createBankingAccount(bvn, dob) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "bvn": bvn,
      "dob": dob
    };
    final response = await client.post(
        '$baseUrl/banking/accounts', data: data, options: Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> getBankingAccount(id) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    final response = await client.get(
        '$baseUrl/banking/accounts/$id', options: Options(
      headers: headerFree,));
    return response;
  }




}
