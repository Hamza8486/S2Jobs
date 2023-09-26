class GetResumeModel {
  bool? success;
  Response? response;

  GetResumeModel({this.success, this.response});

  GetResumeModel.fromJson(Map<String, dynamic> json) {
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
  ResumeData? data;

  Response({this.data});

  Response.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ResumeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ResumeData {
  int? id;
  String? file;
  String? fileName;
  String? createdAt;
  String? type;

  ResumeData({this.id, this.file, this.fileName, this.createdAt, this.type});

  ResumeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'];
    fileName = json['file_name'];
    createdAt = json['created_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file'] = this.file;
    data['file_name'] = this.fileName;
    data['created_at'] = this.createdAt;
    data['type'] = this.type;
    return data;
  }
}
