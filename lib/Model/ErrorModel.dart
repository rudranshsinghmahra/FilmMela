class ErrorModel {
  String? error;

  ErrorModel({this.error});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(error: json['error']);
  }

  Map toJson() => {
        "error": error,
      };
}
