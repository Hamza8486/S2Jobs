import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jobfind/app/authentication/controller/auth_controller.dart';
import 'package:jobfind/app/authentication/model/admin_drop_model.dart';
import 'package:jobfind/app/bottom_tabs/profile/model/education_model.dart';
import 'package:jobfind/app/bottom_tabs/profile/model/experience_model.dart';
import 'package:jobfind/app/bottom_tabs/profile/model/profile_model.dart';
import 'package:jobfind/app/bottom_tabs/profile/model/resume_model.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/app/home/home_view.dart';
import 'package:jobfind/util/constant.dart';
import 'package:jobfind/util/toast.dart';
import 'package:jobfind/widgets/helper_function.dart';


class ApiManger{

  loginResponse({required BuildContext context,phone,deviceToken}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'phone': phone.toString(),
        'device_id': deviceToken.toString(),

      });
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          AppConstants.baseURL + AppConstants.login,
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",


          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        flutterToastSuccess(msg: "Login Successfully");
        HelperFunctions.saveInPreference(
            "token", response.data["response"]['access_token'].toString());

        HelperFunctions.saveInPreference(
            "phone", response.data["response"]['data']['phone_number'].toString());
        HelperFunctions.saveInPreference(
            "id", response.data["response"]['data']['id'].toString());
        Get.offAll(UserHome(),
            transition: Transition.cupertinoDialog
        );
        Get.put(AuthController()).updateLoader(false);


      }

    } on dio.DioError catch (e) {
      Get.put(AuthController()).updateLoader(false);
      flutterToast(msg: e.response?.data.toString());
    }
  }


  editProfile({context,gender,location}) async {
    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          'full_name':Get.put(HomeController()).nameController.text,
          'dob': Get.put(HomeController()).dateOfBirthController.text,
          'gender': gender.toString(),
          'location':location.toString(),
          'email': Get.put(HomeController()).emailController.text,
          'adhar_no': Get.put(HomeController()).adharController.text,
          Get.put(HomeController()).adharFile==null?"":
          'adhar_card':
          Get.put(HomeController()).adharFile == null
              ? "":
          await dio.MultipartFile.fromFile(

              Get.put(HomeController()).adharFile!.path),

        });
        print("Data::::: ${data.fields}");
        print("Data::::: ${data.fields}");
        var response = await dio.Dio().patch(
            AppConstants.baseURL + AppConstants.editProfile,
            data: data,
            options: dio.Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"


            })
        );
        if (response.statusCode == 200) {


          flutterToastSuccess(msg: "Profile Update Successfully");
          //Get.put(HomeController()).adharFile=null;
          Get.put(HomeController()).imageFile=null;
          Get.put(HomeController()).updateProfileLoader(false);
          Get.put(HomeController()).getProfileData();

        }

      } on dio.DioError catch (e) {
        Get.put(HomeController()).updateProfileLoader(false);

        flutterToast(msg: e.response?.data.toString());
        // log("e.response");


      }
    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateProfileLoader(false);
      flutterToast(msg: e.response?.data.toString());
      log(e.toString());
    }
  }


  static Future<AdminDropModel?> getAllDropData() async {
    var response = await http.get(
      Uri.parse("${AppConstants.baseURL}${AppConstants.dropList}"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"
      },
    );

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return AdminDropModel.fromJson(jsonString);
    } else {
      log(response.statusCode.toString());

      //show error message
      return null;
    }
  }


  editImage({context}) async {
    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          Get.put(HomeController()).imageFile==null?"":
          'image':
          Get.put(HomeController()).imageFile == null
              ? "":
          await dio.MultipartFile.fromFile(

              Get.put(HomeController()).imageFile!.path),
        });
        print("Data::::: ${data}");
        print("Data::::: ${data.fields}");
        print("Data::::: ${data.fields}");
        var response = await dio.Dio().patch(
            AppConstants.baseURL + AppConstants.logoUpdate,
            data: data,
            options: dio.Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"


            })
        );
        if (response.statusCode == 200||response.statusCode == 201) {
          print(response.data);
          print(response.data);




        }

      } on dio.DioError catch (e) {
        print(e.response?.data);
        // Get.put(HomeController()).updateProfileLoader(false);
        //
        // flutterToast(msg: e.response?.data.toString());
        // log("e.response");


      }
    } on dio.DioError catch (e) {
      print(e.response?.data);
      // Get.put(HomeController()).updateProfileLoader(false);
      // flutterToast(msg: e.response?.data.toString());
      log(e.toString());
    }
  }



  uploadResume({context}) async {
    try {
      late dio.MultipartFile x, lisenceFile;

      try {
        dio.FormData data = dio.FormData.fromMap({
          Get.put(HomeController()).resumeFile==null?"":
          'file':
          Get.put(HomeController()).resumeFile == null
              ? "":
          await dio.MultipartFile.fromFile(

              Get.put(HomeController()).resumeFile!.path),
        });
        print("Data::::: ${data}");
        print("Data::::: ${data.fields}");
        print("Data::::: ${data.fields}");
        var response = await dio.Dio().post(
            AppConstants.baseURL + AppConstants.createResume,
            data: data,
            options: dio.Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"


            })
        );
        if (response.statusCode == 200||response.statusCode == 201) {
          print(response.data);
          print(response.data);
          flutterToastSuccess(msg: "Resume Upload Successfully");
          Get.put(HomeController()).getResumeAllData();

           Get.put(HomeController()).updateUploadResumeloader(false);


        }

      } on dio.DioError catch (e) {
        print(e.response?.data);
        Get.put(HomeController()).updateUploadResumeloader(false);
        // Get.put(HomeController()).updateProfileLoader(false);
        //
        // flutterToast(msg: e.response?.data.toString());
        // log("e.response");


      }
    } on dio.DioError catch (e) {
      print(e.response?.data);
      Get.put(HomeController()).updateUploadResumeloader(false);
      // Get.put(HomeController()).updateProfileLoader(false);
      // flutterToast(msg: e.response?.data.toString());
      log(e.toString());
    }
  }


  static Future<GetProfileModel?> getProfileData() async {
    var response = await http.get(
      Uri.parse("${AppConstants.baseURL}${AppConstants.getUserProfile}"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"
      },
    );

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return GetProfileModel.fromJson(jsonString);
    } else {
      log(response.statusCode.toString());

      //show error message
      return null;
    }
  }



  aboutMeData({required BuildContext context,about}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'about': about.toString(),


      });
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().patch(
          AppConstants.baseURL + AppConstants.aboutLink,
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"


          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200||response.statusCode == 201) {
        flutterToastSuccess(msg: "Data Updated");
        Get.put(HomeController()).getProfileData();
        Get.put(AuthController()).updateLoader(false);


      }

    } on dio.DioError catch (e) {
      Get.put(AuthController()).updateLoader(false);
      flutterToast(msg: e.response?.data.toString());
    }
  }



  createExperience({required BuildContext context,id,comp,start,end,des}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'job_title': id.toString(),
        'company_name': comp.toString(),
        'start_date': start.toString(),
        'end_date': end.toString(),
        'my_position':Get.put(HomeController()).currentPosition.value.isEmpty?false:true,
        'description': des.toString(),


      });
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          AppConstants.baseURL + AppConstants.createExperience,
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"


          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200||response.statusCode == 201) {
        flutterToastSuccess(msg: "Experience Added successfully");

        Get.put(HomeController()).updateProfloader(false);
        Get.put(HomeController()).getAllExpData();
        Get.back();


      }

    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateProfloader(false);
      flutterToast(msg: e.response?.data.toString());
    }
  }


  createEducation({required BuildContext context,id,comp,start,end,des,field}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'education_title': id.toString(),
        'institute_name': comp.toString(),
        'field_study': field.toString(),
        'start_date': start.toString(),
        'end_date': end.toString(),
        'description': des.toString(),


      });
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().post(
          AppConstants.baseURL + AppConstants.postEdu,
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"


          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200||response.statusCode == 201) {
        flutterToastSuccess(msg: "Education Added successfully");

        Get.put(HomeController()).updateProfloader(false);
        Get.put(HomeController()).getEduAllData();
        Get.back();


      }

    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateProfloader(false);
      flutterToast(msg: e.response?.data.toString());
    }
  }


  delResume({required BuildContext context,id}) async {
    try {


      var response = await dio.Dio().delete(
          "${AppConstants.baseURL+AppConstants.delResume}${id.toString()}/",
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"


          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200||response.statusCode == 201) {
        flutterToastSuccess(msg: "Resume Removed successfully");

        Get.put(HomeController()).updateUploadResumeloader(false);
        Get.put(HomeController()).getResumeAllData();



      }

    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateUploadResumeloader(false);
      flutterToast(msg: e.response?.data.toString());
    }
  }

  updateExperience({required BuildContext context,id,comp,start,end,des,expId}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'job_title': id.toString(),
        'company_name': comp.toString(),
        'start_date': start.toString(),
        'end_date': end.toString(),
        'my_position':Get.put(HomeController()).currentPosition.value.isEmpty?false:true,
        'description': des.toString(),


      });
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().patch(
          "${AppConstants.baseURL+AppConstants.editExp}${expId.toString()}/",
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"


          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200||response.statusCode == 201) {
        flutterToastSuccess(msg: "Experience updated successfully");

        Get.put(HomeController()).updateProfloader(false);
        Get.put(HomeController()).getAllExpData();
        Get.back();


      }

    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateProfloader(false);
      flutterToast(msg: e.response?.data.toString());
    }
  }



  updateEducationData({required BuildContext context,id,comp,start,end,des,eduId,field}) async {
    try {
      dio.FormData data = dio.FormData.fromMap({
        'education_title': id.toString(),
        'institute_name': comp.toString(),
        'field_study': field.toString(),
        'start_date': start.toString(),
        'end_date': end.toString(),
        'description': des.toString(),


      });
      print("Data::::: ${data.fields}");
      var response = await dio.Dio().patch(
          "${AppConstants.baseURL+AppConstants.editEdu}${eduId.toString()}/",
          data: data,
          options: dio.Options(headers: {HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"


          })
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200||response.statusCode == 201) {
        flutterToastSuccess(msg: "Education updated successfully");

        Get.put(HomeController()).updateProfloader(false);
        Get.put(HomeController()).getEduAllData();
        Get.back();


      }

    } on dio.DioError catch (e) {
      Get.put(HomeController()).updateProfloader(false);
      flutterToast(msg: e.response?.data.toString());
    }
  }




  static Future<GetExperienceModel?> getExpData() async {
    var response = await http.get(
      Uri.parse("${AppConstants.baseURL}${AppConstants.getExperience}"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"
      },
    );

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return GetExperienceModel.fromJson(jsonString);
    } else {
      log(response.statusCode.toString());

      //show error message
      return null;
    }
  }


  static Future<GetEducationModel?> getEduData() async {
    var response = await http.get(
      Uri.parse("${AppConstants.baseURL}${AppConstants.getEdu}"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"
      },
    );

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return GetEducationModel.fromJson(jsonString);
    } else {
      log(response.statusCode.toString());

      //show error message
      return null;
    }
  }

  static Future<GetResumeModel?> getResumeData() async {
    var response = await http.get(
      Uri.parse("${AppConstants.baseURL}${AppConstants.getResume}"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: "Token ${Get.put(HomeController()).tokenUserValue.value}"
      },
    );

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print("response.body");
      print(response.body);
      return GetResumeModel.fromJson(jsonString);
    } else {
      log(response.statusCode.toString());

      //show error message
      return null;
    }
  }
}