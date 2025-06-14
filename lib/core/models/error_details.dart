class ErrorDetails {
  final String code;
  final String description;
  final DateTime timestamp;

  ErrorDetails({
    required this.code,
    required this.description,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      code: json['code'],
      description: json['description'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'description': description,
    'timestamp': timestamp.toIso8601String(),
  };
}
