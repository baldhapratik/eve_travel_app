class GetEventModel {
  late int status;
  late String message;
  late List<EventData> data;
  late Map<String, dynamic>? error;

  GetEventModel({
    required this.status,
    required this.message,
    required this.data,
    required this.error,
  });

  GetEventModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = List<EventData>.from(json['data'].map((x) => EventData.fromJson(x)));
    } else {
      data = [];
    }
    error = json['error'];
  }
}

class EventData {
  late String id;
  late String image;
  late String title;
  late String description;
  late bool isAllDay;
  late String startDate;
  late String endDate;
  late double latitude;
  late double longitude;
  late String address;
  late String typeOfEvent;
  late String? cost;
  late String dressCode;
  late List<Participant> participant;
  late bool isFriendInvite;
  late bool isExpire;
  late bool isActive;
  late String notes;
  late String createdBy;
  late String createdAt;
  late String updatedAt;
  late int v;

  EventData({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.isAllDay,
    required this.startDate,
    required this.endDate,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.typeOfEvent,
    this.cost,
    required this.dressCode,
    required this.participant,
    required this.isFriendInvite,
    required this.isExpire,
    required this.isActive,
    required this.notes,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  EventData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image']??'';
    title = json['title'];
    description = json['description'];
    isAllDay = json['isAllDay'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    typeOfEvent = json['typeOfEvent'];
    cost = json['cost'];
    dressCode = json['dressCode'];
    if (json['participant'] != null) {
      participant = List<Participant>.from(
          json['participant'].map((x) => Participant.fromJson(x)));
    } else {
      participant = [];
    }
    isFriendInvite = json['isFriendInvite'];
    isExpire = json['isExpire'];
    isActive = json['isActive'];
    notes = json['notes'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
}

class Participant {
  late String id;
  late String userId;
  late String time;
  late bool isHost;
  late List<UserData> userData;

  Participant({
    required this.id,
    required this.userId,
    required this.time,
    required this.isHost,
    required this.userData,
  });

  Participant.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['userId'];
    time = json['time'];
    isHost = json['isHost'];
    if (json['userData'] != null) {
      userData = List<UserData>.from(
          json['userData'].map((x) => UserData.fromJson(x)));
    } else {
      userData = [];
    }
  }
}

class UserData {
  late String id;
  String? image;
  late String name;

  UserData({
    required this.id,
    this.image,
    required this.name,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
    name = json['name']??'';
  }
}
