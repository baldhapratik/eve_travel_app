class OtpModel {
  late int status;
  late String message;
  late Data data;
  late Map<String, dynamic> error;

  OtpModel({
    required this.status,
    required this.message,
    required this.data,
    required this.error,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : Data(),
      error: json['error'] != null ? Map<String, dynamic>.from(json['error']) : {},
    );
  }
}

class Data {
  String? id;
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
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({
    this.id,
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
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'],
      image: json['image'],
      email: json['email'],
      userName: json['userName'],
      name: json['name'],
      password: json['password'],
      otp: json['otp'],
      followers: json['followers'],
      following: json['following'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      otpExpireTime: json['otpExpireTime'],
      city: json['city'],
      isActive: json['isActive'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
