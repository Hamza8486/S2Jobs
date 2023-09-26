class GetProfileModel {
  bool? success;
  Response? response;

  GetProfileModel({this.success, this.response});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  ProfileModelData? data;

  Response({this.data});

  Response.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ProfileModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileModelData {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? logo;
  String? dob;
  String? gender;
  String? email;
  String? aboutMe;
  String? adharCard;
  String? adharNo;
  Location? location;

  ProfileModelData(
      {this.id,
        this.fullName,
        this.phoneNumber,
        this.logo,
        this.dob,
        this.gender,
        this.email,
        this.aboutMe,
        this.adharCard,
        this.adharNo,
        this.location});

  ProfileModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    logo = json['logo'];
    dob = json['dob'];
    gender = json['gender'];
    email = json['email'];
    aboutMe = json['about_me'];
    adharCard = json['adhar_card'];
    adharNo = json['adhar_no'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    data['logo'] = this.logo;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['about_me'] = this.aboutMe;
    data['adhar_card'] = this.adharCard;
    data['adhar_no'] = this.adharNo;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  String? id;
  String? title;

  Location({this.id, this.title});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
