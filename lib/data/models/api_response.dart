class ApiResponse<T> {

  ApiResponse({
    required this.success, this.detail, this.content
  });

  bool success;
  String? detail;
  T? content;

  bool get isFailed => !success;

}