import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import '../data/models/countries_list_response.dart';
import '../data/models/error_response.dart';


String languages(Languages languages) {
  Map<String, dynamic> langMap = languages.toJson();
  List<String> availableLanguages = langMap.values
      .where((value) => value != null && value.toString().isNotEmpty)
      .map((value) => value.toString())
      .toList();
  String languagesString = availableLanguages.join(", ");

  return languagesString;
}


String parseNetworkError(Response response) {
  try{
  var body = ErrorResponse.fromJson(response.data);
  return body.message;
  } catch (e) {
    if (kDebugMode) {
      print('Error loading static items: $e');
      return 'Error loading static items';
    } else {
      return 'Error loading static items';
    }
  }
}

String formatNumber(double number) {
  String formattedDecimal = NumberFormat("#,##0.00").format(number);

  return formattedDecimal;
}

