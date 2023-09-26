import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/authentication/model/admin_drop_model.dart';
import 'package:jobfind/app/bottom_tabs/profile/model/education_model.dart';
import 'package:jobfind/app/bottom_tabs/profile/model/experience_model.dart';
import 'package:jobfind/app/bottom_tabs/profile/model/profile_model.dart';
import 'package:jobfind/app/bottom_tabs/profile/model/resume_model.dart';
import 'package:jobfind/services/api_manager.dart';
import 'package:jobfind/widgets/helper_function.dart';




class HomeController extends GetxController {






  var updateProfileLoader = false.obs;
  updateProfloader(val){
    updateProfileLoader.value=val;
    update();
  }

  var resumeUploadLoader = false.obs;
  updateUploadResumeloader(val){
    resumeUploadLoader.value=val;
    update();
  }



  var currentPosition="".obs;
  updatePosition(val){
    currentPosition.value=val;
    update();
  }



  var data = "all".obs;
  updateDataHome(val) {
    data.value = val;
    update();
  }
  var name = "all".obs;
  updateName(val) {
    name.value = val;
    update();
  }

  var phoneValue = "".obs;
  var tokenUserValue = "".obs;

  var isValue = true.obs;
  updateLoader(val){
    loader.value = val;
    update();


  }
  var categoryIndex = 0.obs;
  updateCategoryIndex(val) {
    categoryIndex.value = val;
    update();
  }


  var loader = false.obs;

  var id = "".obs;
  var nameUser = "".obs;


  @override
  Future<void> onInit() async {


    HelperFunctions.getFromPreference("id").then((value) {
      id.value = value;


      update();
    });
    HelperFunctions.getFromPreference("token").then((value) {
      tokenUserValue.value = value;
      getDropData();
      getProfileData();
      getAllExpData();
      getEduAllData();
      getResumeAllData();
      print(tokenUserValue.value);


      update();
    });
    HelperFunctions.getFromPreference("phone").then((value) {
      phoneValue.value = value;


      update();
    });


    super.onInit();
    //getHistoryData(id: "30746b29-8044-4c6b-aef8-f5cfdb584200");
  }



  var dropLoader = false.obs;
  var getSkills = <Education>[].obs;
  var getEducation = <Education>[].obs;
  var getLanguage = <Education>[].obs;
  var getJobCategory = <Education>[].obs;
  var getLocation = <Education>[].obs;
  List<Education> originalLocationData = <Education>[];
  List<Education> originalCategoryData = <Education>[];
  List<Education> originalEducationData = <Education>[];

  void filterLocationData(String query) {
    if (query.isEmpty) {
      // If the query is empty, reset the list to show all items.
      getLocation.value = originalLocationData;
    } else {
      getLocation.value = originalLocationData
          .where((country) =>
          country.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void filterCategoryData(String query) {
    if (query.isEmpty) {
      // If the query is empty, reset the list to show all items.
      getJobCategory.value = originalCategoryData;
    } else {
      getJobCategory.value = originalCategoryData
          .where((country) =>
          country.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }


  void filterEducationData(String query) {
    if (query.isEmpty) {
      // If the query is empty, reset the list to show all items.
      getEducation.value = originalEducationData;
    } else {
      getEducation.value = originalEducationData
          .where((country) =>
          country.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  getDropData() async {
    try {

      dropLoader(true);
      update();

      var profData = await ApiManger.getAllDropData();
      if (profData != null) {
        getSkills.value = profData.response?.data?.skill as dynamic;
        getEducation.value = profData.response?.data?.education as dynamic;
        getLanguage.value = profData.response?.data?.language as dynamic;
        originalLocationData =
        profData.response?.data?.location as dynamic;
        getLocation.value = originalLocationData;



        originalCategoryData =
        profData.response?.data?.jobTitle as dynamic;
        getJobCategory.value = originalCategoryData;


        originalEducationData =
        profData.response?.data?.education as dynamic;
        getEducation.value = originalEducationData;

        print(
            "This is all Data ${profData.response?.data}");
      } else {
        dropLoader(false);
        update();
      }
    } catch (e) {

      dropLoader(false);
      update();
      debugPrint(e.toString());
    } finally {
      dropLoader(false);
      update();
    }
    update();
  }



  var fullName = "".obs;
  updateFullName(val){
    fullName.value=val;
    update();
  }

  var aboutMe = "".obs;
  updateAboutMe(val){
    aboutMe.value=val;
    update();
  }
  var image = "".obs;
  updateImage(val){
    image.value=val;
    update();
  }

  var imageAdhaar = "".obs;
  updateAdhaarImage(val){
    imageAdhaar.value=val;
    update();
  }


  ProfileModelData ? profileModelData;


  getProfileData() async {
    try {


      update();

      var profData = await ApiManger.getProfileData();
      if (profData != null) {
        profileModelData=profData.response?.data;
        updateAboutMe(profData.response?.data?.aboutMe==null?"":profData.response?.data?.aboutMe);
        updateFullName(profData.response?.data?.fullName==null?"":profData.response?.data?.fullName);
        updateImage(profData.response?.data?.logo==null?"":profData.response?.data?.logo);
        updateAdhaarImage(profData.response?.data?.adharCard==null?"":profData.response?.data?.adharCard);


        print(
            "This is all Data ${profData.response?.data}");
      } else {

        update();
      }
    } catch (e) {


      update();
      debugPrint(e.toString());
    } finally {

      update();
    }
    update();
  }



  var expLoader = false.obs;
  var expList = <ExperienceData>[].obs;

  getAllExpData() async {
    try {

      expLoader(true);
      update();

      var profData = await ApiManger.getExpData();
      if (profData != null) {
        expList.value = profData.response?.data as dynamic;




        print(
            "This is experience Data ${profData.response?.data}");
      } else {
        expLoader(false);
        update();
      }
    } catch (e) {

      expLoader(false);
      update();
      debugPrint(e.toString());
    } finally {
      expLoader(false);
      update();
    }
    update();
  }




  var eduLoader = false.obs;
  var eduList = <EducationAllData>[].obs;

  getEduAllData() async {
    try {

      eduLoader(true);
      update();

      var profData = await ApiManger.getEduData();
      if (profData != null) {
        eduList.value = profData.response?.data as dynamic;




        print(
            "This is experience Data ${profData.response?.data}");
      } else {
        eduLoader(false);
        update();
      }
    } catch (e) {

      eduLoader(false);
      update();
      debugPrint(e.toString());
    } finally {
      eduLoader(false);
      update();
    }
    update();
  }





  var resumeLoader = false.obs;
  ResumeData ? resumeData;

  getResumeAllData() async {
    try {

      resumeLoader(true);
      update();

      var profData = await ApiManger.getResumeData();
      if (profData != null) {
        resumeData = profData.response?.data as dynamic;




        print(
            "This is Resume Data ${profData.response?.data}");
      } else {
        resumeLoader(false);
        update();
      }
    } catch (e) {

      resumeLoader(false);
      update();
      debugPrint(e.toString());
    } finally {
      resumeLoader(false);
      update();
    }
    update();
  }


  File? imageFile;
  File? adharFile;
  File? resumeFile;
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  var adharController = TextEditingController();

  clearField(){
    locationController.clear();
    nameController.clear();
    emailController.clear();
    dateOfBirthController.clear();
    phoneController.clear();
    adharController.clear();

    imageFile=null;
    adharFile=null;

  }

}

