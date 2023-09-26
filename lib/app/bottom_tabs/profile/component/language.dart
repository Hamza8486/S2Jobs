import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/widgets/app_button.dart';
import 'package:jobfind/widgets/app_text.dart';

class AddLanguage extends StatefulWidget {
  const AddLanguage({Key? key}) : super(key: key);

  @override
  State<AddLanguage> createState() => _AddLanguageState();
}

class _AddLanguageState extends State<AddLanguage> {
  final dashboardController = Get.put(HomeController());

  var qualificationController = TextEditingController();


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
              height: Get.height* 0.02,
            ),
            AppText(
              title: "Language",
              color: AppColor.blackColor,
              size: AppSizes.size_18,
              fontFamily: AppFont.semi,
            ),
            SizedBox(
              height: Get.height* 0.01,
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      ListView.builder(
                        shrinkWrap:
                        Get.put(HomeController()).nameUser.isEmpty?true:
                        true,
                        itemCount:3,
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
                                  12,
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
                                          title: "English",
                                          size:AppSizes.size_14,
                                          color: AppColor.black.withOpacity(0.9),
                                          fontFamily: AppFont.medium,

                                          textAlign: TextAlign.justify,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Divider(color: AppColor.primaryColor.withOpacity(0.5),),
                                  SizedBox(height: 2,),
                                ],
                              ),
                            ),
                          );
                        },
                      )



                    ],
                  ),
                )),

            SizedBox(
              height: Get.height * 0.01,
            ),
            isKeyBoard?SizedBox.shrink():
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
              child: AppButton(buttonName: "Save", buttonColor: AppColor.primaryColor, textColor: Colors.white, onTap: (){


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
