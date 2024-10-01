import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

import '../Model/ErrorModel.dart';

class ApiBaseHelper {
  Future<dynamic> getApiCall(
      Uri apiEndPoint, Map<String, Object>? param) async {
    dynamic responseJson;
    try {
      final finalUri = param != null
          ? apiEndPoint.replace(queryParameters: param)
          : apiEndPoint;

      final response = await get(finalUri, headers: {
        "Content-Type": "application/json",
        "x-rapidapi-key": "${dotenv.env['API_KEY']}",
      });

      print(finalUri);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Something went wrong, try again later');
    }
    return responseJson;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        var responseJsonError = ErrorModel.fromJson(json.decode(response.body));
        throw BadRequestException(responseJsonError.error);
      case 401:
      case 403:
        var responseJsonError = ErrorModel.fromJson(json.decode(response.body));
        throw UnauthorisedException(responseJsonError.error);
      case 500:
      default:
        {
          throw FetchDataException(
              'Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
        }
    }
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}
