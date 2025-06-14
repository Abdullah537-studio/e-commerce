import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/database/remote/api_consumer.dart';
import 'package:e_commerce_app/core/database/remote/api_interseptors.dart';
import 'package:e_commerce_app/core/database/remote/api_urls.dart';
import 'package:flutter/foundation.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio) {
    dio.options = BaseOptions(
      baseUrl: ApiUrls.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    dio.interceptors.add(ApiInterseptors());

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  //!------------------------ HTTP Methods ------------------------
  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool requireAuth = true,
  }) async {
    return _request(
      () => dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(extra: {'requireAuth': requireAuth}),
      ),
    );
  }

  @override
  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool requireAuth = true,
  }) async {
    return _request(
      () => dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(extra: {'requireAuth': requireAuth}),
      ),
    );
  }

  @override
  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool requireAuth = true,
  }) async {
    return _request(
      () => dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(extra: {'requireAuth': requireAuth}),
      ),
    );
  }

  Future<dynamic> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool requireAuth = true,
  }) async {
    return _request(
      () => dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(extra: {'requireAuth': requireAuth}),
      ),
    );
  }

  //!------------------------ Core Request Handler ------------------------
  Future<dynamic> _request(Future<Response> Function() request) async {
    try {
      final response = await request();
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        return _parseServerError(e.response!);
      }
      return _handleNetworkError(e);
    } catch (e) {
      return {
        'success': false,
        'error': {'code': 'unhandled_exception', 'message': e.toString()},
      };
    }
  }

  //!------------------------ Error Handlers ------------------------
  Map<String, dynamic> _handleNetworkError(DioException error) {
    debugPrint('DioError: ${error.toString()}');

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return _buildErrorResponse('connection_timeout', 'انتهت مهلة الاتصال');
      case DioExceptionType.sendTimeout:
        return _buildErrorResponse('send_timeout', 'مهلة إرسال البيانات');
      case DioExceptionType.receiveTimeout:
        return _buildErrorResponse('receive_timeout', 'مهلة استقبال البيانات');
      case DioExceptionType.badCertificate:
        return _buildErrorResponse('ssl_error', 'خطأ في شهادة الأمان');
      case DioExceptionType.connectionError:
        return _buildErrorResponse('no_connection', 'لا يوجد اتصال بالإنترنت');
      case DioExceptionType.cancel:
        return _buildErrorResponse('request_cancelled', 'تم إلغاء الطلب');
      default:
        return _buildErrorResponse('network_error', 'خطأ في الشبكة');
    }
  }

  Map<String, dynamic> _parseServerError(Response response) {
    try {
      return {
        'success': false,
        'error':
            response.data['error'] ??
            {'code': 'server_error', 'message': 'خطأ غير معروف من السيرفر'},
      };
    } catch (e) {
      return _buildErrorResponse('parse_error', 'فشل في تحليل الاستجابة');
    }
  }

  Map<String, dynamic> _buildErrorResponse(String code, String message) {
    return {
      'success': false,
      'error': {'code': code, 'message': message},
    };
  }

  @override
  Future patche(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    throw UnimplementedError();
  }
}
