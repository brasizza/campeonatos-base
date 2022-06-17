import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../rest_client.dart';
import '../rest_client_exception.dart';
import '../rest_client_response.dart';

class DioRestClient implements RestClient {
  final Dio _dio = Dio();

  static DioRestClient? _instance;

  DioRestClient._() {
    log('Start the DioRestClient instance');
  }

  static DioRestClient get instance {
    _instance ??= DioRestClient._();
    return _instance!;
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.patch(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.post(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.put(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path, {required String method, data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.request(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  Future<RestClientResponse<T>> _dioResponseConverter<T>(Response<dynamic> response) async {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Never _throwRestClientException(DioError dioError) {
    final response = dioError.response;

    throw RestClientException(
      error: dioError.error,
      message: response?.statusMessage,
      statusCode: response?.statusCode,
      response: RestClientResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
      ),
    );
  }
}
