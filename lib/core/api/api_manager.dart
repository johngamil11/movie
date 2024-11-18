
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../utils/constants.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body}) {
    return dio.get(AppConstants.baseUrl + endPoint ,
        data: body,
        queryParameters: {
      'api_key' :'f104ae6f88a48446aeb2e4802e8907f7'
        },
        options: Options(headers: headers, validateStatus: (status) => true));
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body}) {
    return dio.post(AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: headers, validateStatus: (status) => true));
  }

  Future<Response> deleteData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body}) {
    return dio.delete(AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: headers, validateStatus: (status) => true));
  }

  Future<Response> updateData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body}) {
    return dio.put(AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: headers, validateStatus: (status) => true));
  }
}

