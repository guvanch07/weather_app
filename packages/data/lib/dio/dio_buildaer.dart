import 'package:dio/dio.dart';

Dio dioBuilder(
  String baseUrl,
  List<Interceptor> interceptors, {
  Map<String, dynamic>? headers,
}) {
  const timeout = 70000;
  final headersMap = headers ?? <String, dynamic>{};

  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: timeout,
    receiveTimeout: timeout,
    sendTimeout: timeout,
    headers: headersMap,
    contentType: 'application/json',
  );

  final dio = Dio(options);

  dio.interceptors.addAll(interceptors);

  return dio;
}
