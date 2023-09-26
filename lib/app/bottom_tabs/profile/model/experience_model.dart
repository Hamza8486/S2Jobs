class GetExperienceModel {
  bool? success;
  Response? response;

  GetExperienceModel({this.success, this.response});

  GetExperienceModel.fromJson(Map<String, dynamic> json) {
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
  List<ExperienceData>? data;

  Response({this.data});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ExperienceData>[];
      json['data'].forEach((v) {
        data!.add(new ExperienceData.fromJson(v));
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

class ExperienceData {
  int? id;
  JobTitle? jobTitle;
  String? companyName;
  String? startDate;
  String? endDate;
  bool? myPosition;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? user;

  ExperienceData(
      {this.id,
        this.jobTitle,
        this.companyName,
        this.startDate,
        this.endDate,
        this.myPosition,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.user});

  ExperienceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitle = json['job_title'] != null
        ? new JobTitle.fromJson(json['job_title'])
        : null;
    companyName = json['company_name'];
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
    if (this.jobTitle != null) {
      data['job_title'] = this.jobTitle!.toJson();
    }
    data['company_name'] = this.companyName;
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

class JobTitle {
  String? id;
  String? title;

  JobTitle({this.id, this.title});

  JobTitle.fromJson(Map<String, dynamic> json) {
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
