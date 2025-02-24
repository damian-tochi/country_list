import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';


class AppApi {
  final client = Dio();
  static const baseUrl = "https://restcountries.com/v3.1";
  var headerFree = {"content-type": "application/json"};

  ///List of countries in Africa *
  Future<Response> getCountries() async {
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
      '$baseUrl/region/africa',
      queryParameters: {
        "status": "true",
        "fields": "name,languages,capital,flags",
      },
      options: Options(
        headers: headerFree,
      ),
    );
    return response;
  }

  ///Country details by name *
  Future<Response> getCountry(String name) async {
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
    final response = await client.get('$baseUrl/name/$name',
        options: Options(
          headers: headerFree,
        ));
    return response;
  }
}
