import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../Consts/global_func.dart';
import '../helpers/api_state.dart';
import '../models/signup_response.dart';
import '../service/api_service.dart';


class AuthApiCubit extends Cubit<ApiState> {
  var verifyApi = AppApi();
  bool isRegisteredUserEmail = false;
  bool isRegisteredUsername = false;

  String username = '';
  String emailAddress = '';
  String password = '';
  String token = '';

  int authTokeAction = 0; //0 = Signup, 1 = Pass Reset

  AuthApiCubit() : super(ApiInitial());


  Future<void> signInEmail(String email, String pass) async {
    emit(ApiLoading());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      Response response = await verifyApi.signInEmail(email, pass);

      if (response.statusCode == 200) {
        // var formattedResponse = SignInResponse.fromJson(response.data);
        // var token = formattedResponse.data.tokens.accessToken;
        // sharedPreferences.setString("token", token);
        // globalString = token;

        emit(ApiSuccess(response.data));
      } else {
        String msg = parseNetworkError(response);
        emit(ApiFailure(msg));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  clearErrors() {
    emit(ApiInitial());
  }

  emitError(String err) {
    emit(ApiErrorMsg(err));
  }

  Future<void> verifyData(String fName, String lName, String email, String pass,
      String secondPassword) async {
    if (fName.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Enter Firstname"));
    } else if (lName.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Enter Lastname"));
    } else if (email.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Enter Email"));
    } else if (pass.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Enter Password"));
    } else if (secondPassword.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Confirm Password"));
    } else {
      if (pass.compareTo(secondPassword) == 0) {
        signUpUser(fName, lName, email, pass);
      } else {
        emit(ApiErrorRegisterOnlyMsg("Passwords do not match"));
      }
    }
  }

  Future<void> signUpUser(String fName, String lName, String email, String pass) async {
    emit(ApiLoading());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      final response = await verifyApi.signUpNewUser(fName, lName, email, pass);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var signUpResp = signUpResponseFromJson(response.data);
        emailAddress = email;
        emit(ApiSuccessString(emailAddress));
      } else {
        emit(ApiFailure(
            'Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> requestTokenWithEmail(String email) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.serverRequestEmailOTP(email);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        if (jsonResponse != null) {
          emit(ApiSuccessString(emailAddress));
        } else {
          emit(ApiErrorMsg(
              ""));
        }
      } else {
        emit(ApiFailure(
            'Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> requestToken() async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.serverRequestEmailOTP(emailAddress);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ApiSuccessString(emailAddress));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> confirmSignUpToken(String token) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.serverVerifyEmailOTP(emailAddress, token);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        emit(ApiSuccessString(emailAddress));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }



  Future<void> requestResetPassToken(email) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.resetPassOTP(email);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        emit(ApiSuccessString('TokenInput'));
        emailAddress = email;
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> confirmToken(String tokenTxt) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.confirmResetPassEmail(emailAddress, tokenTxt);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        token = tokenTxt;
        emit(ApiSuccessString(emailAddress));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> verifyResetPassData(String pass,
      String secondPassword) async {
    if (pass.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Enter Password"));
    } else if (secondPassword.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Confirm Password"));
    } else {
      if (pass.compareTo(secondPassword) == 0) {
        resetPass(pass);
      } else {
        emit(ApiErrorRegisterOnlyMsg("Passwords do not match"));
      }
    }
  }

  Future<void> resetPass(String pass) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.resetPasswordRequest(emailAddress, token, pass);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        emit(ApiSuccessString(emailAddress));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }


  String getEmail() {
    return emailAddress;
  }

  int getTokenAction() {
    return authTokeAction;
  }


}

