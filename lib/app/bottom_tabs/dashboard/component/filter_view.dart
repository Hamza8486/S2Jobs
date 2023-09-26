import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfind/app/authentication/login/component/phone_component.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/util/toast.dart';
import 'package:jobfind/widgets/app_button.dart';
import 'package:jobfind/widgets/app_text.dart';

class ApplyFilter extends StatefulWidget {
  const ApplyFilter({Key? key}) : super(key: key);

  @override
  State<ApplyFilter> createState() => _ApplyFilterState();
}

class _ApplyFilterState extends State<ApplyFilter> {
  final dashboardController = Get.put(HomeController());

  var qualificationController = TextEditingController();
  var companyController = TextEditingController();
  var startController = TextEditingController();
  var endController = TextEditingController();
  var description = TextEditingController();
  var subjectType = TextEditingController();

  String?job;

  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
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
                  title: "Apply Filter",
                  color: AppColor.blackColor,
                  size: AppSizes.size_18,
                  fontFamily: AppFont.semi,
                ),
                Container()
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
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Job category",color: Colors.transparent),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),

                    SizedBox(
                      width: Get.width,
                      child: dropDownAppAdd(
                        hint: "Select Job category",
                        width: Get.width*0.93,
                        items: [
                          "Solo",
                          "Group",

                        ],
                        value:job,
                        onChange: (value) {



                        },
                      ),
                    ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Qualification",color: Colors.transparent),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      jobField(
                          hint: "Select qualification",
                          onTap: (){
                            Get.defaultDialog(
                                title: "",
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: Get.width*0.012),
                                titlePadding: EdgeInsets.zero,
                                content: SizedBox(
                                  height: Get.height * 0.38,
                                  width: Get.width*0.7,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: Get.height * 0.049,
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal:Get.width*0.02 ),
                                          child: TextFormField(
                                            onChanged: (val) {


                                            },

                                            style: TextStyle(

                                              fontSize:13,
                                              color: AppColor.black,
                                            ),
                                            decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                color:   AppColor.black,
                                                fontSize: 12,

                                              ),
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 10),
                                              hintText:"Search here",
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColor.black
                                                      .withOpacity(0.7),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              enabledBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColor.black
                                                      .withOpacity(0.7),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              disabledBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColor.black
                                                      .withOpacity(0.7),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: Get.height * 0.015),
                                      Expanded(child: Obx(
                                              () {
                                            return
                                              // controller.countryLoader.value?
                                              // Column(
                                              //   children: [
                                              //     SizedBox(
                                              //       height:
                                              //       Get.height *
                                              //           0.08,
                                              //     ),
                                              //     Center(
                                              //         child:
                                              //         CircularProgressIndicator(
                                              //           color: AppColors
                                              //               .Purple_Color,
                                              //         )),
                                              //   ],
                                              // ):
                                              ListView.builder(
                                                shrinkWrap:
                                                Get.put(HomeController()).nameUser.isEmpty?true:
                                                true,
                                                itemCount:4,
                                                itemBuilder:
                                                    (BuildContext
                                                context,
                                                    int index) {
                                                  // final result = stores[index];

                                                  return GestureDetector(
                                                    onTap: () {
                                                      Get.back();

                                                    },
                                                    child:
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          vertical:
                                                          6,
                                                          horizontal:
                                                          10),
                                                      child:
                                                      Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.check_box_outline_blank,
                                                                size: Get.height*0.026,
                                                                color: AppColor.primaryColor,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                Get.width * 0.02,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                Get.width * 0.48,
                                                                child: AppText(
                                                                  title: "BSCS",
                                                                  size:AppSizes.size_13,
                                                                  color: AppColor.black.withOpacity(0.9),
                                                                  fontFamily: AppFont.medium,

                                                                  textAlign: TextAlign.justify,),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 2,),
                                                          Divider(color: AppColor.primaryColor.withOpacity(0.4),),
                                                          SizedBox(height: 2,),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                          }
                                      ))




                                    ],
                                  ),
                                ));
                          },
                          isRead: true,
                          isCur: false,

                          controller: qualificationController,
                          textInputAction: TextInputAction.done
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Skills",color: Colors.transparent),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      jobField(
                          hint: "Select skills",
                          onTap: (){
                            Get.defaultDialog(
                                title: "",
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: Get.width*0.012),
                                titlePadding: EdgeInsets.zero,
                                content: SizedBox(
                                  height: Get.height * 0.45,
                                  width: Get.width*0.7,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: Get.height * 0.049,
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal:Get.width*0.02 ),
                                          child: TextFormField(
                                            onChanged: (val) {


                                            },

                                            style: TextStyle(

                                              fontSize:13,
                                              color: AppColor.black,
                                            ),
                                            decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                color:   AppColor.black,
                                                fontSize: 12,

                                              ),
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 10),
                                              hintText:"Search skills",
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColor.black
                                                      .withOpacity(0.7),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              enabledBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColor.black
                                                      .withOpacity(0.7),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              disabledBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColor.black
                                                      .withOpacity(0.7),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: Get.height * 0.015),
                                      Expanded(child: Obx(
                                              () {
                                            return
                                              // controller.countryLoader.value?
                                              // Column(
                                              //   children: [
                                              //     SizedBox(
                                              //       height:
                                              //       Get.height *
                                              //           0.08,
                                              //     ),
                                              //     Center(
                                              //         child:
                                              //         CircularProgressIndicator(
                                              //           color: AppColors
                                              //               .Purple_Color,
                                              //         )),
                                              //   ],
                                              // ):
                                              ListView.builder(
                                                shrinkWrap:
                                                Get.put(HomeController()).nameUser.isEmpty?true:
                                                true,
                                                itemCount:13,
                                                itemBuilder:
                                                    (BuildContext
                                                context,
                                                    int index) {
                                                  // final result = stores[index];

                                                  return GestureDetector(
                                                    onTap: () {
                                                      Get.back();

                                                    },
                                                    child:
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          vertical:
                                                          6,
                                                          horizontal:
                                                          10),
                                                      child:
                                                      Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.check_box_outline_blank,
                                                                size: Get.height*0.026,
                                                                color: AppColor.primaryColor,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                Get.width * 0.02,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                Get.width * 0.48,
                                                                child: AppText(
                                                                  title: "Leadership",
                                                                  size:AppSizes.size_13,
                                                                  color: AppColor.black.withOpacity(0.9),
                                                                  fontFamily: AppFont.medium,

                                                                  textAlign: TextAlign.justify,),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 2,),
                                                          Divider(color: AppColor.primaryColor.withOpacity(0.4),),
                                                          SizedBox(height: 2,),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                          }
                                      ))




                                    ],
                                  ),
                                ));
                          },
                          isRead: true,
                          isCur: false,

                          controller: qualificationController,
                          textInputAction: TextInputAction.done
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Location",color: Colors.transparent),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),

                      SizedBox(
                        width: Get.width,
                        child: dropDownAppAdd(
                          hint: "Select location",
                          width: Get.width*0.93,
                          items: [
                            "lahore",
                            "punjab",

                          ],
                          value:job,
                          onChange: (value) {



                          },
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      textAuth(text: "Job Type",color: Colors.transparent),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),

                      SizedBox(
                        width: Get.width,
                        child: dropDownAppAdd(
                          hint: "Select Job type",
                          width: Get.width*0.93,
                          items: [
                            "Full Time",
                            "Part Time",
                            "Remotely",

                          ],
                          value:job,
                          onChange: (value) {



                          },
                        ),
                      ),


                    ],
                  ),
                )),

            SizedBox(
              height: Get.height * 0.01,
            ),
            isKeyBoard?SizedBox.shrink():
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
              child: AppButton(buttonName: "Apply", buttonColor: AppColor.primaryColor, textColor: Colors.white, onTap: (){


              },
                buttonRadius: BorderRadius.circular(10),
                buttonWidth: Get.width,
              ),
            ),
            isKeyBoard?SizedBox.shrink():
            SizedBox(
              height: Get.height * 0.01,
            ),



          ],
        ),
      ),
    );
  }


}
