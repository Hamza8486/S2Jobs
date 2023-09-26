

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfind/app/bottom_tabs/profile/component/add_education.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/util/toast.dart';
import 'package:jobfind/widgets/app_text.dart';

class EducationList extends StatelessWidget {
  EducationList({Key? key}) : super(key: key);

  final dashboardController = Get.put(HomeController());

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                AppText(
                  title: "My Education",
                  color: AppColor.blackColor,
                  size: AppSizes.size_18,
                  fontFamily: AppFont.semi,
                ),
                Obx(
                        () {
                      return
                        dashboardController.eduList.isEmpty?SizedBox():
                        GestureDetector(
                          onTap: (){
                            dashboardController.updatePosition("");
                            Get.to(AddEducation());

                          },
                          child: Container(
                            height: Get.height * 0.042,
                            width: Get.height * 0.042,
                            decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Get.height * 0.1))),
                            child: Icon(
                              Icons.add,
                              color: AppColor.white,
                              size: AppSizes.size_20,
                            ),
                          ),
                        );
                    }
                )

              ],
            ),

            SizedBox(
              height: Get.height* 0.01,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(
                      height: Get.height* 0.015,
                    ),


                    Obx(
                            () {
                          return
                            dashboardController.eduLoader.value?loader():
                            dashboardController.eduList.isEmpty? GestureDetector(
                              onTap: (){
                                dashboardController.updatePosition("");
                                Get.to(AddEducation());
                              },
                              child: Column(

                                  children: [
                                    SizedBox(height: Get.height * 0.3),
                                    Image.asset( "assets/images/mortarboard.png",
                                      height: Get.height*0.06,),
                                    SizedBox(height: Get.height * 0.01),
                                    Center(
                                        child: AppText(
                                          title: "Click to add Education",
                                          size: Get.height * 0.017,
                                          color: AppColor.blackColor,
                                          textAlign: TextAlign.center,
                                          fontFamily: AppFont.medium,
                                        )),
                                    SizedBox(height: Get.height * 0.01),

                                    Container(
                                      width: Get.width*0.2,
                                      decoration: BoxDecoration(color: AppColor.primaryColor,borderRadius: BorderRadius.circular(10)),
                                      child:Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(width: Get.width*0.01,),
                                            AppText(
                                              title: "Add",
                                              color: AppColor.white,
                                              size: AppSizes.size_13,
                                              fontFamily: AppFont.medium,
                                            ),

                                            Icon(Icons.add,color: AppColor.white,size: Get.height*0.02,)
                                          ],
                                        ),
                                      ),
                                    ),                                      ]
                              ),
                            ):

                            ListView.builder(
                                itemCount: dashboardController.eduList.length,
                                shrinkWrap: true,
                                primary: false,
                                padding: EdgeInsets.zero,
                                itemBuilder: (BuildContext context, int index) {

                                  return  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(

                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      AppText(
                                                        title: (dashboardController.eduList[index].educationTitle?.title).toString(),
                                                        color: AppColor.primaryColor.withOpacity(0.7),
                                                        size: AppSizes.size_15,
                                                        fontFamily: AppFont.semi,
                                                      ),
                                                      AppText(
                                                        title:"(${(dashboardController.eduList[index].fieldStudy).toString()})",
                                                        color: Colors.orange,
                                                        size: AppSizes.size_12,
                                                        fontFamily: AppFont.medium,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: Get.height*0.001,),
                                                  AppText(
                                                    title: (dashboardController.eduList[index].instituteName).toString(),
                                                    color:Colors.black,
                                                    size: AppSizes.size_14,
                                                    fontFamily: AppFont.regular,
                                                  ),
                                                  SizedBox(height: Get.height*0.001,),
                                                  AppText(
                                                    title:
                                                    dashboardController.eduList[index].endDate==null?DateFormat('MMM dd').format(DateTime.parse(dashboardController.eduList[index].startDate.toString())):

                                                    "${DateFormat('MMM dd').format(DateTime.parse(dashboardController.eduList[index].startDate.toString()))} - ${DateFormat('MMM dd').format(DateTime.parse(dashboardController.eduList[index].endDate.toString()))}",
                                                    color:Colors.grey,
                                                    size: AppSizes.size_13,
                                                    fontFamily: AppFont.regular,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap:(){
                                                  Get.to(AddEducation(type: "update",
                                                    eduData:dashboardController.eduList[index] ,
                                                  ));
                                                },
                                                child: Image.asset("assets/images/edit.png",
                                                  height: Get.height*0.027,),
                                              ),
                                              SizedBox(width: Get.width*0.05,),
                                              Image.asset("assets/images/del.png",
                                                height: Get.height*0.027,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: Get.height*0.01,),
                                      Divider(color: AppColor.primaryColor,),
                                      SizedBox(height: Get.height*0.01,),
                                    ],
                                  );
                                });
                        }
                    ),



                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


}


