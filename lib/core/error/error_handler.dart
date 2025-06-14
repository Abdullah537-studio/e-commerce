// ملف: lib/core/error/error_handler.dart
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/error/failures.dart';

class ErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is ServerException) {
      return ServerFailure(error.message, statusCode: error.statusCode);
    } else if (error is CacheException) {
      return CacheFailure(error.message);
    } else if (error is NetworkException) {
      return NetworkFailure(error.message);
    } else {
      return UnknownFailure("حدث خطأ غير متوقع");
    }
  }
}
