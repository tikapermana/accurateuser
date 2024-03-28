import 'dart:convert';
import 'package:accurate/core/models/api_data.dart';
import 'package:http/http.dart' as http;

class ApiRest {
  static String methodPost = "POST";
  static String methodGet = "GET";
  static String methodPut = "PUT";
  static String methodDelete = "PUT";

  static int defaultTimeOutTime = 20;

  static String successCode = "API-000";
  static String failedCode = "API-001";
  static String invalidCode = "API-002 ";
  static String failedTitle = "Failed to get data";
  static String invalidTitle = "Invalid to get data";

  ApiDataModel onTimeOutConnection({
    int? timeout,
    required String module}){
    Map<String, dynamic> onTimeOut = {
      'code': 408,
      'api': failedCode,
      'title': failedTitle + " - " + module,
      'subtitle': "Time out after " + (timeout == null ?
        defaultTimeOutTime.toString() : timeout.toString()),
      'body': null
    };
    ApiDataModel dataModel = ApiDataModel(
        code: 408,
        api: failedCode,
        title:  failedTitle + " - " + module,
        subtitle: "Time out after " + (timeout == null ?
        defaultTimeOutTime.toString() : timeout.toString()),
        body: null,
        module: module
    );
    return dataModel;
  }

  Future<ApiDataModel> onFetchOrProcessData({
    required String url,
    required String module,
    required String methodType,
    Map<String, String>? header,
    Map? body
  }) async {

    late Map<String, dynamic> result;
    late ApiDataModel dataModel;
    http.Response response = methodType == 'GET' ?
    await http.get(Uri.parse(url), headers: header) :
    await http.post(Uri.parse(url), headers: header, body: jsonEncode(body));

    if(response.statusCode == 200 &&
        !response.body.toUpperCase().contains('INVALID TOKEN') &&
        !response.body.toUpperCase().contains('UNAUTORIZED') &&
        !response.body.toUpperCase().contains('SERVER UNAVAILABLE')){

      dataModel = ApiDataModel(
          code: response.statusCode,
          api: successCode,
          title: "Success to get Data - $module",
          subtitle: "Success",
          body: response.body,
          module: module
      );
      result = {
        'code': response.statusCode,
        'api': successCode,
        'title': "Success to get Data - $module",
        'subtitle': "Success",
        'body': response.body
      };

    } else if(response.statusCode == 400){
      dataModel = ApiDataModel(
          code: response.statusCode,
          api: failedCode,
          title:  failedTitle + " - " + module,
          subtitle: "Bad Request",
          body: response.body,
          module: module
      );
      result = {
        'code': response.statusCode,
        'api': failedCode,
        'title':  module != null ?
        (failedTitle + " - " + module) :
        (failedTitle),
        'subtitle': "Bad Request",
        'body': response.body
      };
    } else if(response.statusCode == 401){
      dataModel = ApiDataModel(
          code: response.statusCode,
          api: failedCode,
          title:  failedTitle + " - " + module,
          subtitle: "Unautorized",
          body: response.body,
          module: module
      );
      result = {
        'code': response.statusCode,
        'api': failedCode,
        'title':  module != null ?
        (failedTitle + " - " + module) :
        (failedTitle),
        'subtitle': "",
        'body': response.body
      };
    } else if(response.statusCode == 404){
      dataModel = ApiDataModel(
          code: response.statusCode,
          api: failedCode,
          title:  failedTitle + " - " + module,
          subtitle: "Not Found",
          body: response.body,
          module: module
      );
      result = {
        'code': response.statusCode,
        'api': failedCode,
        'title':  module != null ?
        (failedTitle + " - " + module) :
        (failedTitle),
        'subtitle': "Not Found",
        'body': response.body
      };
    } else if(response.statusCode == 500){
      dataModel = ApiDataModel(
          code: response.statusCode,
          api: failedCode,
          title:  failedTitle + " - " + module,
          subtitle: "Internal Server Error",
          body: response.body,
          module: module
      );
      result = {
        'code': response.statusCode,
        'api': failedCode,
        'title':  module != null ?
        (failedTitle + " - " + module) :
        (failedTitle),
        'subtitle': "Internal Server Error",
        'body': response.body
      };
    } else if(response.statusCode == 502){
      dataModel = ApiDataModel(
          code: response.statusCode,
          api: failedCode,
          title:  failedTitle + " - " + module,
          subtitle: "Bad Gateway",
          body: response.body,
          module: module
      );
      result = {
        'code': response.statusCode,
        'api': failedCode,
        'title':  module != null ?
        (failedTitle + " - " + module) :
        (failedTitle),
        'subtitle': "Bad Gateway",
        'body': response.body
      };
    } else if(response.statusCode == 503){
      dataModel = ApiDataModel(
          code: response.statusCode,
          api: failedCode,
          title:  failedTitle + " - " + module,
          subtitle: "Service Unavailable",
          body: response.body,
          module: module
      );
      result = {
        'code': response.statusCode,
        'api': failedCode,
        'title':  module != null ?
        (failedTitle + " - " + module) :
        (failedTitle),
        'subtitle': "Service Unavailable",
        'body': response.body
      };
    } else {
      dataModel = ApiDataModel(
          code: response.statusCode,
          api: invalidCode,
          title:  invalidTitle + " - " + module,
          subtitle: invalidTitle,
          body: response.body,
          module: module
      );
      result = {
        'code': response.statusCode,
        'api': invalidCode,
        'title': module != null ?
        (invalidTitle + " - " + module) :
        (invalidTitle),
        'subtitle': invalidTitle + "",
        'body': response.body
      };
    }
    return dataModel;
  }
}