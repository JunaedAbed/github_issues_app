import 'dart:convert';

import 'package:get/get.dart';
import 'package:github_issues_app/core/errors/app_exceptions.dart';

class ApiClient extends GetConnect implements GetxService {
  String? bearerToken;

  @override
  String? get baseUrl => "https://api.github.com/repos";

  final GetConnect connect = Get.find<GetConnect>();

  Future<dynamic> getData(String endpoint) async {
    try {
      print('$baseUrl/$endpoint');

      final response = await connect.get('$baseUrl/$endpoint');
      return _processResponse(response);
    } catch (e) {
      print("Error in getData: $e");
      throw e;
    }
  }

  Future<dynamic> postData(String endpoint, Map<String, dynamic> data) async {
    try {
      print('Request Data: ${json.encode(data)}');

      Response response = await connect.post(
        '$baseUrl/$endpoint',
        json.encode(data),
      );
      var responseJson = _processResponse(response);
      return responseJson;
    } catch (e) {
      print("Error in postData: $e");
      throw e;
    }
  }
}

_processResponse(Response response) async {
  switch (response.statusCode) {
    case 200:
      var resJson = response.bodyString!;
      return resJson;
    case 201:
      var resJson = response.bodyString!;
      return resJson;
    case 400:
      throw BadRequestException(
          response.bodyString!, response.request?.url.toString());
    case 401:
      final Map<String, dynamic> errorData = json.decode(response.bodyString!);
      final String errorMessage = errorData['errors']['message'];
      throw UnauthorizedException(
          errorMessage, response.request?.url.toString());
    case 404:
      final Map<String, dynamic> errorData = json.decode(response.bodyString!);
      final String errorMessage = errorData['errors']['message'];
      throw DataNotFoundException(
          errorMessage, response.request?.url.toString());
    case 500:
    default:
      throw FetchDataException(
          "Error occured with code: ${response.statusCode}",
          response.request?.url.toString());
  }
}
