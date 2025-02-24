import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../consts/global_func.dart';
import '../helpers/api_state.dart';
import '../models/country_response.dart';
import '../service/api_service.dart';

class CountryDetailCubit extends HydratedCubit<ApiState> {
  var appApi = AppApi();
  List<CountryResp> country = [];

  CountryDetailCubit() : super(ApiInitial());

  Future<void> getCountry(String name) async {
    emit(ApiLoading());
    try {
      Response response = await appApi.getCountry(name);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final countryResponse = countryRespFromJson(jsonEncode(response.data));
        country = countryResponse;
        emit(ApiCountryResult(result: country));
      } else {
        String msg = parseNetworkError(response);
        emit(ApiFailure(failure: msg));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final errorMessage = e.response!.data['message'];
        emit(ApiFailure(failure: '$errorMessage'));
      } else {
        emit(ApiFailure(failure:'Unexpected error: ${e.message}'));
      }
      emit(ApiFailure(failure: 'Request failed with error: $e'));
      if (kDebugMode) {
        print(e);
      }
    }
  }

  clearErrors() {
    emit(ApiInitial());
  }

  emitError(String err) {
    emit(ApiError( error:err));
  }

  @override
  ApiState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey("result")) {
      return ApiCountryResult.fromJson(json);
    }
    return ApiInitial();
  }

  @override
  Map<String, dynamic>? toJson(ApiState state) {
    if (state is ApiCountryResult) {
      return state.toJson();
    }
    return null;
  }

}
