class ApiResponse<T extends Serializable> {
  int code;
  String message;
  T data;

  ApiResponse({required this.code, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return ApiResponse<T>(
      code: json["code"],
      message: json["message"],
      data: create(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "code": this.code,
    "message": this.message,
    "data": this.data.toJson()
  };

}

abstract class Serializable {
  Map<String, dynamic> toJson();
}
