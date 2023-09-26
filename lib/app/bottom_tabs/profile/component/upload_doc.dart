
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/widgets/app_button.dart';
import 'package:jobfind/widgets/app_text.dart';

class UploadDocuments extends StatefulWidget {
  UploadDocuments({Key? key}) : super(key: key);

  @override
  State<UploadDocuments> createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  final dashboardController = Get.put(HomeController());

  File ?file;

  void pickImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],

    ).then((value) {
      if(value!= null )
      {

        file = File(value.paths.first!
        );
        setState(() {

        });
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.055,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                color: Colors.transparent,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: Get.height * 0.03,
                ),
              ),
            ),

            SizedBox(
              height: Get.height* 0.03,
            ),
            AppText(
              title: "Add Certificates/Documents",
              color: AppColor.blackColor,
              size: AppSizes.size_18,
              fontFamily: AppFont.semi,
            ),
            SizedBox(
              height: Get.height* 0.02,
            ),
            GestureDetector(
              onTap: pickImage,
              child: Container(width: Get.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1.5),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: Get.height*0.014),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_file,
                        color: Colors.black.withOpacity(0.5),
                        size: Get.height*0.03,
                      ),
                      SizedBox(width: Get.width*0.02,),
                      AppText(
                        title: "Upload Docs",
                        color: AppColor.primaryColor,
                        size: AppSizes.size_12,
                        fontFamily: AppFont.medium,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: Get.height* 0.005,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(
                      height: Get.height* 0.005,
                    ),


                    ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) {
                          return  Padding(
                            padding:  EdgeInsets.symmetric(vertical: 10),
                            child: Container(width: Get.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xfff2f0fe)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(vertical: Get.height*0.013,horizontal: Get.width*0.02),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(

                                      children: [
                                        Image.asset("assets/images/doc.png",
                                          height: Get.height*0.05,
                                        ),
                                        SizedBox(width: Get.width*0.02,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              title: "Hamza Sabir",
                                              color: AppColor.primaryColor.withOpacity(0.7),
                                              size: AppSizes.size_13,
                                              fontFamily: AppFont.semi,
                                            ),
                                            SizedBox(height: Get.height*0.001,),
                                            AppText(
                                              title: "14 Feb 2022",
                                              color:Colors.grey,
                                              size: AppSizes.size_13,
                                              fontFamily: AppFont.regular,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Image.asset("assets/images/del.png",
                                      height: Get.height*0.03,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),



                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            AppButton(buttonName: "Save", buttonColor: AppColor.primaryColor, textColor: Colors.white, onTap: (){
              if(validateAbout(context)){}

            },
              buttonRadius: BorderRadius.circular(10),
              buttonWidth: Get.width,
            ),
          ],
        ),
      ),
    );
  }

  bool validateAbout(BuildContext context) {

    // if (des.text.isEmpty) {
    //   flutterToast(msg: "Please enter about me");
    //   return false;
    // }



    return true;
  }
}
