class LoginModel {
  int? status;
  String? message;
  Data? data;
  Error? error;

  LoginModel({this.status, this.message, this.data, this.error});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}

class Data {
  Response? response;
  String? token;
  String? refreshToken;

  Data({this.response, this.token, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null ? Response.fromJson(json['response']) : null;
    token = json['token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    data['token'] = token;
    data['refresh_token'] = refreshToken;
    return data;
  }
}

class Response {
  int? latitude;
  int? longitude;
  String? sId;
  dynamic image;
  String? email;
  String? userName;
  String? name;
  String? password;
  dynamic otp;
  dynamic loginType;
  dynamic otpExpireTime;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? following;
  int? followers;

  Response({
    this.latitude,
    this.longitude,
    this.sId,
    this.image,
    this.email,
    this.userName,
    this.name,
    this.password,
    this.otp,
    this.loginType,
    this.otpExpireTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.following,
    this.followers,
  });

  Response.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    sId = json['_id'];
    image = json['image'];
    email = json['email'];
    userName = json['userName'];
    name = json['name'];
    password = json['password'];
    otp = json['otp'];
    loginType = json['loginType'];
    otpExpireTime = json['otpExpireTime'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    following = json['following'];
    followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['_id'] = sId;
    data['image'] = image;
    data['email'] = email;
    data['userName'] = userName;
    data['name'] = name;
    data['password'] = password;
    data['otp'] = otp;
    data['loginType'] = loginType;
    data['otpExpireTime'] = otpExpireTime;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['following'] = following;
    data['followers'] = followers;
    return data;
  }
}

class Error {
  Error();

  Error.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
