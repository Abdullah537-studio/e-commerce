import 'package:e_commerce_app/core/models/error_details.dart';

class ResponseModel<T> {
  final bool success;
  final String message;
  final T? data;
  final ErrorDetails? error;

  ResponseModel({
    required this.success,
    this.message = '',
    this.data,
    this.error,
  });

  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return ResponseModel<T>(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      error: json['error'] != null
          ? ErrorDetails.fromJson(json['error'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data,
    'error': error?.toJson(),
  };

  // للتحقق من وجود بيانات
  bool get hasData => data != null;

  // للتعامل مع الحالات المختلفة
  void when({
    required Function(T data) onSuccess,
    required Function(ErrorDetails error) onError,
  }) {
    if (success) {
      onSuccess(data as T);
    } else {
      onError(error!);
    }
  }

  // نسخة مبسطة للاستجابات الناجحة
  factory ResponseModel.success(T data, [String message = '']) {
    return ResponseModel<T>(success: true, message: message, data: data);
  }

  // نسخة مبسطة للأخطاء
  factory ResponseModel.fail(String errorCode, String errorMessage) {
    return ResponseModel<T>(
      success: false,
      error: ErrorDetails(code: errorCode, description: errorMessage),
    );
  }
}
