import 'package:dio/dio.dart';

Dio getDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 20)
    ..options.receiveTimeout = const Duration(seconds: 20)
    ..interceptors.addAll(
      [
        LogInterceptor(
          responseBody: true,
        ),
      ],
    );

  return dio;
}
