class GetEducationModel {
  bool? success;
  Response? response;

  GetEducationModel({this.success, this.response});

  GetEducationModel.fromJson(Map<String, dynamic> json) {
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
  List<EducationAllData>? data;

  Response({this.data});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <EducationAllData>[];
      json['data'].forEach((v) {
        data!.add(new EducationAllData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EducationAllData {
  int? id;
  EducationTitle? educationTitle;
  String? instituteName;
  String? fieldStudy;
  String? startDate;
  String? endDate;
  bool? myPosition;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? user;

  EducationAllData(
      {this.id,
        this.educationTitle,
        this.instituteName,
        this.fieldStudy,
        this.startDate,
        this.endDate,
        this.myPosition,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.user});

  EducationAllData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    educationTitle = json['education_title'] != null
        ? new EducationTitle.fromJson(json['education_title'])
        : null;
    instituteName = json['institute_name'];
    fieldStudy = json['field_study'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    myPosition = json['my_position'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.educationTitle != null) {
      data['education_title'] = this.educationTitle!.toJson();
    }
    data['institute_name'] = this.instituteName;
    data['field_study'] = this.fieldStudy;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['my_position'] = this.myPosition;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user'] = this.user;
    return data;
  }
}

class EducationTitle {
  String? id;
  String? title;

  EducationTitle({this.id, this.title});

  EducationTitle.fromJson(Map<String, dynamic> json) {
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
