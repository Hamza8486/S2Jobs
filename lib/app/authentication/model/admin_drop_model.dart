class AdminDropModel {
  bool? success;
  ResponseModelAll? response;

  AdminDropModel({this.success, this.response});

  AdminDropModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    response = json['response'] != null
        ? new ResponseModelAll.fromJson(json['response'])
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

class ResponseModelAll {
  DropListData? data;

  ResponseModelAll({this.data});

  ResponseModelAll.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DropListData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DropListData {
  List<Education>? education;
  List<Education>? language;
  List<Education>? location;
  List<Education>? jobTitle;
  List<Education>? skill;

  DropListData(
      {this.education,
        this.language,
        this.location,
        this.jobTitle,
        this.skill});

  DropListData.fromJson(Map<String, dynamic> json) {
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education!.add(new Education.fromJson(v));
      });
    }
    if (json['language'] != null) {
      language = <Education>[];
      json['language'].forEach((v) {
        language!.add(new Education.fromJson(v));
      });
    }
    if (json['location'] != null) {
      location = <Education>[];
      json['location'].forEach((v) {
        location!.add(new Education.fromJson(v));
      });
    }
    if (json['job_title'] != null) {
      jobTitle = <Education>[];
      json['job_title'].forEach((v) {
        jobTitle!.add(new Education.fromJson(v));
      });
    }
    if (json['skill'] != null) {
      skill = <Education>[];
      json['skill'].forEach((v) {
        skill!.add(new Education.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.education != null) {
      data['education'] = this.education!.map((v) => v.toJson()).toList();
    }
    if (this.language != null) {
      data['language'] = this.language!.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location!.map((v) => v.toJson()).toList();
    }
    if (this.jobTitle != null) {
      data['job_title'] = this.jobTitle!.map((v) => v.toJson()).toList();
    }
    if (this.skill != null) {
      data['skill'] = this.skill!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Education {
  String? id;
  String? title;

  Education({this.id, this.title});

  Education.fromJson(Map<String, dynamic> json) {
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
