
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/services/api_manager.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/util/toast.dart';
import 'package:jobfind/widgets/app_button.dart';
import 'package:jobfind/widgets/app_text.dart';

class ResumeUpload extends StatefulWidget {
  ResumeUpload({Key? key}) : super(key: key);

  @override
  State<ResumeUpload> createState() => _ResumeUploadState();
}

class _ResumeUploadState extends State<ResumeUpload> {
  final dashboardController = Get.put(HomeController());

  String? extension;

  void pickImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],

    ).then((value) {
      if(value!= null )
      {


        dashboardController.resumeFile = File(value.paths.first!
        );
        String? filePath = dashboardController.resumeFile?.path;
        extension = filePath?.split('.').last;
        print(extension);
        print( dashboardController.resumeFile?.path.split('/file_picker/').last);
        print( dashboardController.resumeFile?.path.split('/file_picker/').last);
        print( dashboardController.resumeFile?.path.split('/file_picker/').last);
        // ApiManger().uploadResume(context: context);
        setState(() {

        });
      }
      return null;
    });
  }


  // GestureDetector(
  // onTap: (){
  // file = null;
  // },
  // child: AppText(
  // title: file?.path.split('/file_picker/').last??"",
  // color: Colors.black,
  // size: AppSizes.size_13,
  // fontFamily: AppFont.medium,
  // ),
  // ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
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
                   Obx(
                     () {
                       return
                         dashboardController.resumeLoader.value?loader():
                             dashboardController.resumeData!=null?

                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 AppText(
                                   title: "My Resume",
                                   color: AppColor.blackColor,
                                   size: AppSizes.size_18,
                                   fontFamily: AppFont.semi,
                                 ),
                                 SizedBox(
                                   height: Get.height* 0.02,
                                 ),
                                 Container(width: Get.width,
                                   decoration: BoxDecoration(
                                       border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1.5),
                                       borderRadius: BorderRadius.circular(10),
                                       color: Color(0xfff2f0fe)
                                   ),
                                   child: Padding(
                                     padding:  EdgeInsets.symmetric(vertical: Get.height*0.018,horizontal: Get.width*0.02),
                                     child: Column(
                                       children: [

                                         Row(

                                           children: [
                                             dashboardController.resumeData?.type==".pdf"?
                                             Image.asset("assets/images/pdf.png",
                                               height: Get.height*0.07,
                                             ):Image.asset("assets/images/doc.png",
                                               height: Get.height*0.07,
                                             ),
                                             SizedBox(width: Get.width*0.02,),
                                             Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 AppText(
                                                   title: (dashboardController.resumeData?.fileName).toString(),
                                                   color: AppColor.primaryColor.withOpacity(0.7),
                                                   size: AppSizes.size_13,
                                                   fontFamily: AppFont.semi,
                                                 ),
                                                 SizedBox(height: Get.height*0.001,),
                                                 AppText(
                                                   title: DateFormat('MMM dd').format(DateTime.parse((dashboardController.resumeData?.createdAt).toString())),
                                                   color:Colors.grey,
                                                   size: AppSizes.size_13,
                                                   fontFamily: AppFont.regular,
                                                 ),
                                               ],
                                             ),
                                           ],
                                         ),
                                         SizedBox(
                                           height: Get.height * 0.02,
                                         ),
                                         Obx(
                                           () {
                                             return
                                               dashboardController.resumeUploadLoader.value?
                                               Center(
                                                   child: SpinKitThreeBounce(
                                                       size: 18, color: AppColor.blackColor)
                                               ):

                                               GestureDetector(
                                               onTap:(){
                                                 dashboardController.updateUploadResumeloader(true);
                                                 ApiManger().delResume(context: context,id: dashboardController.resumeData?.id.toString());
                                               },
                                               child: Container(
                                                 color:Colors.transparent,
                                                 child: Padding(
                                                   padding:  EdgeInsets.only(left: Get.width*0.02),
                                                   child: Row(

                                                     children: [
                                                       Image.asset("assets/images/del.png",
                                                         height: Get.height*0.03,
                                                       ),
                                                       SizedBox(width: Get.width*0.02,),
                                                       AppText(
                                                         title: "Remove File",
                                                         color: Colors.red,
                                                         size: AppSizes.size_14,
                                                         fontFamily: AppFont.medium,
                                                       ),
                                                     ],
                                                   ),
                                                 ),
                                               ),
                                             );
                                           }
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ):
                         Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           AppText(
                             title: "Add Resume",
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
                                       title: "Upload CV/Resume",
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
                             height: Get.height * 0.04,
                           ),
                           Container(width: Get.width,
                             decoration: BoxDecoration(
                                 border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1.5),
                                 borderRadius: BorderRadius.circular(10),
                                 color: Color(0xfff2f0fe)
                             ),
                             child: Padding(
                               padding:  EdgeInsets.symmetric(vertical: Get.height*0.018,horizontal: Get.width*0.02),
                               child: Column(
                                 children: [
                                   Row(

                                     children: [
                                       Image.asset("assets/images/pdf.png",
                                         height: Get.height*0.07,
                                       ),
                                       SizedBox(width: Get.width*0.02,),
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           AppText(
                                             title: "Hamza Sabir - UI/UX Designer",
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
                                   SizedBox(
                                     height: Get.height * 0.016,
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(left: Get.width*0.02),
                                     child: Row(

                                       children: [
                                         Image.asset("assets/images/del.png",
                                           height: Get.height*0.03,
                                         ),
                                         SizedBox(width: Get.width*0.02,),
                                         AppText(
                                           title: "Remove File",
                                           color: Colors.red,
                                           size: AppSizes.size_14,
                                           fontFamily: AppFont.medium,
                                         ),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),

                         ],
                       );
                     }
                   ),



                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.016,
          ),
          dashboardController.resumeData!=null||dashboardController.resumeData!=""?SizedBox.shrink():
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
            child: AppButton(buttonName: "Upload", buttonColor: AppColor.primaryColor, textColor: Colors.white, onTap: (){
              if(validateResume(context)){
                dashboardController.updateUploadResumeloader(true);
                ApiManger().uploadResume(context: context);
              }

            },
              buttonRadius: BorderRadius.circular(10),
              buttonWidth: Get.width,
            ),
          ),
          SizedBox(
            height: Get.height * 0.016,
          ),
        ],
      ),
    );
  }

  bool validateResume(BuildContext context) {

    if (dashboardController.resumeFile==null) {
      flutterToast(msg: "Please select resume");
      return false;
    }



    return true;
  }
}
