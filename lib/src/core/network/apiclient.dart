import 'dart:developer';
import 'package:ai_analysis/main.dart';
import 'package:ai_analysis/src/core/cache/shared_pref_helper.dart';
import 'package:ai_analysis/src/core/resources/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: ApiConstants.baseUrl),
  )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = SharedPrefHelper.getString(StorageKeys.token);
          if (token.isNotEmpty) {
            log('from interceptor ----- $token');
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    )
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    );
}
