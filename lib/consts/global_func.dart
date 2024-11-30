
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/error_response.dart';
import '../ui/components/alerts.dart';


final shuffleNotifier = ValueNotifier<bool>(false);
final repeatNotifier = ValueNotifier<bool>(false);

final playNextSongAutomatically = ValueNotifier<bool>(true);

class GlobalFunc {

  static Color stringToMaterialColor(String colorString) {
    if (colorString.startsWith('#') && colorString.length == 7) {
      return Color(int.parse(colorString.substring(1), radix: 16) + 0xFF000000);
    } else {
      return Colors.white;
    }
  }

  static int getCount(count) {
    if (count > 4) {
      return 4;
    } else {
      return count;
    }
  }

  static int getFiveCount(count) {
    if (count > 5) {
      return 5;
    } else {
      return count;
    }
  }

  static int getCountType(count, type) {
    if (type == 0) {
      return getCount(count);
    } else {
      return count;
    }
  }

  static String getListSize(size) {
    return size.toString();
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

String formatDuration(int audioDurationInSeconds) {
  final duration = Duration(seconds: audioDurationInSeconds);

  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);

  var formattedDuration = '';

  if (hours > 0) {
    formattedDuration += '${hours.toString().padLeft(2, '0')}:';
  }

  formattedDuration += '${minutes.toString().padLeft(2, '0')}:';
  formattedDuration += seconds.toString().padLeft(2, '0');

  return formattedDuration;
}

bool isAlphanumeric(String value){
  String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}


String deviceCount(int deviceList) {
  if(deviceList > 1) {
    return "$deviceList devices";
  } else {
    return "$deviceList device";
  }
}

String getTitleHDTxt(String mText) {
  final text = mText.trim();
  final words = text.split(' ');
  final firstTwoChars = words.isNotEmpty ? words[0][0] + (words.length > 1 ? words[1][0] : '') : '';

  return firstTwoChars;
}


String getBankLogo(String bankName) {
  var returnVal = "";
  if (bankName == "Access Bank") {
    returnVal = 'assets/access.jpg';
  } else if (bankName == "Fidelity Bank") {
    returnVal = 'assets/fidelity.jpg';
  } else if (bankName == "Zenith Bank") {
    returnVal = 'assets/zenith.jpg';
  } else if (bankName == "GTBank") {
    returnVal = 'assets/gtbank.jpg';
  } else {
    returnVal = 'assets/firstbank.jpg';
  }

  return returnVal;

}

String getLastTenDigits(String input) {
  String digitsOnly = input.replaceAll(RegExp(r'\D'), '');
  int startIndex = digitsOnly.length > 10 ? digitsOnly.length - 10 : 0;
  return digitsOnly.substring(startIndex);
}

updateAccountVisibilityPref(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isAccountNumberVisibility', value);
}

updateKoboVisibilityPref(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isKoboNumberVisibility', value);
}

String convertListToDateString(List<int> dateList) {
  if (dateList.length != 3) {
    throw Exception('Date list must contain exactly three elements: [year, month, day]');
  }

  int year = dateList[0];
  int month = dateList[1];
  int day = dateList[2];

  DateTime dateTime = DateTime(year, month, day);

  // Format the date as 'MMMM dd yyyy'
  String formattedDate = DateFormat('MMMM dd yyyy').format(dateTime);
  return formattedDate;
}


void copyText(String clipText, BuildContext context) {
  Clipboard.setData(ClipboardData(text: clipText)).then((_) {
    greenSuccessAlert("Copied to clipboard", context);
  });
}

Future<void> saveLoginTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('lastLoginTime', DateTime.now().millisecondsSinceEpoch);
}

Future<bool> hasBeenTenMinutes() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? lastLoginTime = prefs.getInt('lastLoginTime');

  if (lastLoginTime != null) {
    DateTime lastLogin = DateTime.fromMillisecondsSinceEpoch(lastLoginTime);
    DateTime now = DateTime.now();
    Duration difference = now.difference(lastLogin);
    return difference.inMinutes >= 10;
  }

  return true;
}

bool hasTokenExceededTenMinutes(String dateTimeString) {
  DateTime parsedDateTime = DateTime.parse(dateTimeString);
  DateTime now = DateTime.now().toUtc();
  Duration difference = now.difference(parsedDateTime);
  return difference.inMinutes >= 10;
}

Future<void> clearSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}

String maskEmail(String email) {
  List<String> parts = email.split('@');
  String maskedName = parts[0].replaceRange(
      1, parts[0].length - 1, '*' * (parts[0].length - 2));
  return '$maskedName@${parts[1]}';
}

void parseNetworkError(http.Response response, BuildContext context) {
  try{
  var body = ErrorResponse.fromJson(json.decode(response.body));
  redFailedAlert(body.developerMessage, context);
  } catch (e) {
    if (kDebugMode) {
      print('Error loading static items: $e');
    }
  }
}

