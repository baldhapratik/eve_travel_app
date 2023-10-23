class ForgetPasswordModel {
  late int status;
  late String message;
  late Map<String, dynamic> data;
  late Map<String, dynamic> error;

  ForgetPasswordModel({
    required this.status,
    required this.message,
    required this.data,
    required this.error,
  });

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    error = json['error'];
  }
}
