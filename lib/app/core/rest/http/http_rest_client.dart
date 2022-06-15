import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:tabela_brasileirao_serie_a/app/core/rest/rest_client.dart';
import 'package:tabela_brasileirao_serie_a/app/core/rest/rest_client_response.dart';
import 'package:http/http.dart' as http;

import '../rest_client_exception.dart';

class HttpRestClient implements RestClient {
  static HttpRestClient? _instance;

  @override
  Future<RestClientResponse<T>> delete<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    late Response response;
    try {
      Map<String, String>? _headers = (headers == null) ? null : headers as Map<String, String>;
      response = await http.get(Uri.parse(path), headers: _headers);
      return _HttpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path, {required String method, data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    throw UnimplementedError();
  }

  HttpRestClient._() {
    log('Start the HttpRestClient instance');
  }

  static HttpRestClient get instance {
    _instance ??= HttpRestClient._();
    return _instance!;
  }

  Future<RestClientResponse<T>> _HttpResponseConverter<T>(Response response) async {
    return RestClientResponse<T>(data: json.decode(response.body), statusCode: response.statusCode, statusMessage: '');
  }

  Never _throwRestClientException(HttpException exception, Response? response) {
    throw RestClientException(
      error: exception.message,
      message: exception.message,
      statusCode: response?.statusCode,
      response: RestClientResponse(
        data: (response == null) ? '' : json.decode(response.body),
        statusCode: response?.statusCode,
        statusMessage: '',
      ),
    );
  }
}
