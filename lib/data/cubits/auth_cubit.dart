import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/api_state.dart';
import '../service/api_service.dart';


class AuthApiCubit extends Cubit<ApiState> {
  var verifyApi = AppApi();
  bool isRegisteredUserEmail = false;
  bool isRegisteredUsername = false;

  String username = '';
  String emailAddress = '';
  String password = '';

  AuthApiCubit() : super(ApiInitial());

  // Future<void> loginClick(String email, String password) async {
  //   bool isValidEmail = EmailValidator.validate(email);
  //   if (isValidEmail) {
  //     signInEmail(email, password);
  //   } else {
  //     signInUsername(email, password);
  //   }
  // }

  // Future<void> signInUsername(email, pass) async {
  //   emit(ApiLoading());
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   try {
  //     final response = await verifyApi.signInUsername(email, pass);
  //
  //     if (response.statusCode == 200) {
  //       var formattedResponse = SignInResponse.fromJson(response.data);
  //       var token = formattedResponse.data.tokens.accessToken;
  //       sharedPreferences.setString("token", token);
  //       globalString = token;
  //
  //       emit(ApiSuccess(response.data));
  //       getUser();
  //     } else {
  //       emit(ApiFailure(
  //           'Error: ${response.statusCode} - ${response.statusMessage}'));
  //     }
  //   } catch (e) {
  //     emit(ApiFailure('Request failed with error: $e'));
  //   }
  // }
  //
  // Future<void> signInEmail(email, pass) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   try {
  //     final response = await verifyApi.signInEmail(email, pass);
  //
  //     if (response.statusCode == 200) {
  //       var formattedResponse = SignInResponse.fromJson(response.data);
  //       var token = formattedResponse.data.tokens.accessToken;
  //       sharedPreferences.setString("token", token);
  //       globalString = token;
  //
  //       emit(ApiSuccess(response.data));
  //       getUser();
  //     } else {
  //       emit(ApiFailure(
  //           'Error: ${response.statusCode} - ${response.statusMessage}'));
  //     }
  //   } catch (e) {
  //     emit(ApiFailure('Request failed with error: $e'));
  //   }
  // }
  //
  // Future<void> validateEmail(String email) async {
  //   emit(ApiLoading());
  //   bool isValidEmail = EmailValidator.validate(email);
  //   if (isValidEmail) {
  //     serverConfirmEmail(email);
  //   } else {
  //     confirmUser(email);
  //   }
  // }
  //
  // Future<void> serverConfirmEmail(email) async {
  //   var verifyApi = AppApi();
  //   try {
  //     final response = await verifyApi.serverConfirmEmail(email);
  //
  //     if (response.statusCode == 200) {
  //       var formattedResponse = UserExistsResp.fromJson(response.data);
  //       var token = formattedResponse.data.exists;
  //       emit(ApiSuccess(response.data));
  //       if (token) {
  //         emit(ApiErrorRegisterOnlyMsg("Email already taken"));
  //         emit(ApiSuccess(response.data));
  //         isRegisteredUserEmail = true;
  //       } else {
  //         emit(ApiErrorMsg("Email not linked to an existing uduX account"));
  //         isRegisteredUserEmail = false;
  //       }
  //     } else {
  //       emit(ApiErrorMsg('Email not linked to an existing uduX account'));
  //       emit(ApiErrorRegisterOnlyMsg("Email already taken"));
  //     }
  //   } catch (e) {
  //     emit(ApiFailure('Request failed with error: $e'));
  //   }
  // }

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

  Future<void> signUpUser(fName, lName, email, pass) async {
    emit(ApiLoading());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      final response = await verifyApi.signUpNewUser(fName, lName, email, pass);

      if (response.statusCode == 200 || response.statusCode == 201) {

        emit(ApiSuccessString(emailAddress));
      } else {
        emit(ApiFailure(
            'Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> requestToken(String email) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.serverRequestEmailOTP(email);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        if (jsonResponse != null) {
          emit(ApiSuccessString(emailAddress));
        } else {
          emit(ApiErrorMsg(
              "This email you've input isn't \nlinked to an existing uduX account. \n \nPlease Create an Account"));
        }
      } else {
        emit(ApiFailure(
            'Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }


}

