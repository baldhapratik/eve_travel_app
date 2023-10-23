class SignUpModel {
  late int status;
  late String message;
  late Data data;
  late Map<String, dynamic> error;

  SignUpModel({
    required this.status,
    required this.message,
    required this.data,
    required this.error,
  });

  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
    error = json['error'];
  }
}

class Data {
  late Response response;
  late String token;
  late String refreshToken;

  Data({
    required this.response,
    required this.token,
    required this.refreshToken,
  });

  Data.fromJson(Map<String, dynamic> json) {
    response = Response.fromJson(json['response']);
    token = json['token'];
    refreshToken = json['refresh_token'];
  }
}

class Response {
  String? image;
  String? email;
  String? userName;
  String? name;
  String? password;
  int? otp;
  int? followers;
  int? following;
  int? latitude;
  int? longitude;
  String? otpExpireTime;
  String? city;
  bool? isActive;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Response({
    this.image,
    this.email,
    this.userName,
    this.name,
    this.password,
    this.otp,
    this.followers,
    this.following,
    this.latitude,
    this.longitude,
    this.otpExpireTime,
    this.city,
    this.isActive,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Response.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    email = json['email'];
    userName = json['userName'];
    name = json['name'];
    password = json['password'];
    otp = json['otp'];
    followers = json['followers'];
    following = json['following'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    otpExpireTime = json['otpExpireTime'];
    city = json['city'];
    isActive = json['isActive'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
}
