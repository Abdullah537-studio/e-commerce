// ملف: lib/core/error/failures.dart
abstract class Failure {
  final String message; // رسالة الخطأ الصديقة للمستخدم
  final String? code; // كود خطأ تقني (اختياري)
  final StackTrace? stackTrace; // لتتبع الأخطاء في الـ Debug

  const Failure(this.message, {this.code, this.stackTrace});

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

// أنواع الأخطاء الشائعة في جميع التطبيقات
class NetworkFailure extends Failure {
  const NetworkFailure(super.message, {super.code, super.stackTrace});
}

class ServerFailure extends Failure {
  const ServerFailure(
    super.message, {
    super.code,
    super.stackTrace,
    int? statusCode,
  });
}

class CacheFailure extends Failure {
  const CacheFailure(super.message, {super.code, super.stackTrace});
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message, {super.code, super.stackTrace});
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message, {super.code, super.stackTrace});
}

//  الاستعمال
//! في الـ Repository
// Future<Either<Failure, User>> getUser() async {
//   try {
//     final user = await remoteDataSource.getUser();
//     return Right(user);
//   } on DioException catch (e, stackTrace) {
//     return Left(NetworkFailure(e.message ?? "Network Error", stackTrace: stackTrace));
//   }
// }
