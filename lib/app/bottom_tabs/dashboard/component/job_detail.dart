import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/widgets/app_button.dart';
import 'package:jobfind/widgets/app_text.dart';


class JobDetailPage extends StatelessWidget {
  const JobDetailPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // DateTime date =
    // DateTime.parse(data.date);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.04),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.055,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                    SizedBox(
                      width: Get.width * 0.03,
                    ),
                    AppText(
                      title: "Job Detail",
                      color: AppColor.blackColor,
                      size: AppSizes.size_18,
                      fontFamily: AppFont.semi,
                    ),
                  ],
                ),

                Icon(Icons.bookmark,
                  color: Colors.black,
                  size: Get.height*0.034,
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: Get.height * 0.02,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width*0.05),
                  width: Get.width,
                  height: Get.height*0.14,
                  decoration: BoxDecoration(
                    color: AppColor.grey1,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        title: "Senior Mobile Developer",
                        size: AppSizes.size_15,
                        fontFamily: AppFont.semi,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primaryColor,
                      ),

                      AppText(
                        title: "System Private Limited",
                        size: AppSizes.size_13,
                        fontFamily: AppFont.medium,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: Get.height*0.025,),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          AppText(
                            title: "Salary",
                            size: AppSizes.size_13,
                            fontFamily: AppFont.medium,
                            color: AppColor.primaryColor,
                          ),
                          AppText(
                            title: "\$150",
                            size: AppSizes.size_12,
                            fontFamily: AppFont.semi,
                            color: AppColor.black,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          AppText(
                            title: "Job Type",
                            size: AppSizes.size_13,
                            fontFamily: AppFont.medium,
                            color: AppColor.primaryColor,
                          ),
                          AppText(
                            title: "Mobile Developer",
                            size: AppSizes.size_13,
                            fontFamily: AppFont.semi,
                            color: AppColor.black,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          AppText(
                            title: "Position",
                            size: AppSizes.size_13,
                            fontFamily: AppFont.medium,
                            color: AppColor.primaryColor,
                          ),
                          AppText(
                            title: "Senior",
                            size: AppSizes.size_13,
                            fontFamily: AppFont.semi,
                            color: AppColor.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height*0.025,),
                AppText(
                  title: "Description",
                  size: AppSizes.size_14,
                  fontFamily: AppFont.semi,
                  color: Colors.black,
                ),
                SizedBox(height: Get.height*0.005,),
                AppText(
                  title: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  size: AppSizes.size_12,
                  fontFamily: AppFont.regular,
                  color: Colors.black.withOpacity(0.6),
                ),
                SizedBox(height: Get.height*0.025,),
                AppText(
                  title: "Location",
                  size: AppSizes.size_14,
                  fontFamily: AppFont.semi,
                  color: Colors.black,
                ),
                SizedBox(height: Get.height*0.005,),
                AppText(
                  title: "California, USA",
                  size: AppSizes.size_12,
                  fontFamily: AppFont.regular,
                  color: Colors.black.withOpacity(0.6),
                ),
                SizedBox(height: Get.height*0.025,),
                AppText(
                  title: "Requirements",
                  size: AppSizes.size_14,
                  fontFamily: AppFont.semi,
                  color: Colors.black,
                ),
                SizedBox(height: Get.height*0.005,),
                AppText(
                  title: "California, USA",
                  size: AppSizes.size_12,
                  fontFamily: AppFont.regular,
                  color: Colors.black.withOpacity(0.6),
                ),



              ],)),
            SizedBox(
              height: Get.height * 0.01,
            ),
            AppButton(buttonName: "Apply Now", buttonColor: AppColor.primaryColor, textColor: Colors.white, onTap: (){},
            buttonRadius: BorderRadius.circular(10),
              buttonWidth: Get.width,
            )

          ],
        ),
      ),
    );
  }
}
