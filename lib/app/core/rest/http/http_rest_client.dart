import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'http.dart';

class HttpRestClient implements RestClient {
  static HttpRestClient? _instance;
  late Response response;

  HttpRestClient._() {
    log('Start the HttpRestClient instance');
  }

  static HttpRestClient get instance {
    _instance ??= HttpRestClient._();
    return _instance!;
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      Map<String, String>? newHeaders = (headers == null) ? null : headers as Map<String, String>;
      response = await http.delete(Uri.parse(path), headers: newHeaders, body: data, encoding: encoding);
      return httpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      Map<String, String>? newHeaders = (headers == null) ? null : headers as Map<String, String>;
      response = await http.get(Uri.parse(path), headers: newHeaders);
      return httpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      Map<String, String>? newHeaders = (headers == null) ? null : headers as Map<String, String>;
      response = await http.patch(Uri.parse(path), headers: newHeaders, body: data, encoding: encoding);
      return httpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      Map<String, String>? newHeaders = (headers == null) ? null : headers as Map<String, String>;
      response = await http.post(Uri.parse(path), headers: newHeaders, body: data, encoding: encoding);
      return httpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      Map<String, String>? newHeaders = (headers == null) ? null : headers as Map<String, String>;
      response = await http.put(Uri.parse(path), headers: newHeaders, body: data, encoding: encoding);
      return httpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path, {required String method, data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      Map<String, String>? newHeaders = (headers == null) ? null : headers as Map<String, String>;
      response = await http.post(Uri.parse(path), headers: newHeaders, body: data, encoding: encoding);
      return httpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  Future<RestClientResponse<T>> httpResponseConverter<T>(Response response) async => RestClientResponse<T>(data: json.decode(response.body), statusCode: response.statusCode, statusMessage: '');

  Never _throwRestClientException(HttpException exception, Response? response) {
    throw RestClientException(
      error: exception.message,
      message: exception.message,
      statusCode: response?.statusCode,
      response: RestClientResponse(
        data: (response == null) ? '' : json.decode(response.body),
        statusCode: response?.statusCode,
        statusMessage: exception.message,
      ),
    );
  }
}
