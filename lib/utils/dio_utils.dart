import 'package:dio/dio.dart';
import 'package:iottive_pract/utils/constants.dart';

class DioUtils {
  static final Dio _dio = Dio(
      BaseOptions(
        baseUrl: AppConstant.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: 'application/json',
      ),
    )
    ..interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        logPrint: (object) => print(object),
      ),
    );

  static Dio getDio() => _dio;
}
