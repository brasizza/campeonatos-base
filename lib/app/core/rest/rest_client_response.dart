
class RestClientResponse<T> {
  T? data;
  int? statusCode;
  String? statusMessage;
  RestClientResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
}
