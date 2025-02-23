import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../Consts/global_func.dart';
import '../helpers/api_state.dart';
import '../service/api_service.dart';


class RecipientsApiCubit extends Cubit<ApiState> {
  var verifyApi = AppApi();

  RecipientsApiCubit() : super(ApiInitial());


  Future<void> createRecipients(String bankName, String bankCode, String accountNumber, String accountName, String bankLogo) async {
    emit(ApiLoading());
    try {
      Response response = await verifyApi.createRecipients(bankName, bankCode, accountNumber, accountName, bankLogo);
      if (response.statusCode == 200) {
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

  Future<void> getAllRecipients() async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.getAllRecipients();
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        if (jsonResponse != null) {
          emit(ApiSuccessString(jsonResponse));
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

  Future<void> getARecipient(String id) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.getARecipient(id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ApiSuccessString(response.data));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> deleteARecipient(String id) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.deleteARecipient(id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ApiSuccessString("Recipient deleted successfully"));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

}

