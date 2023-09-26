import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/bottom_tabs/dashboard/component/job_detail.dart';
import 'package:jobfind/app/bottom_tabs/my_jobs/component/add_job.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/widgets/app_text.dart';

class MyJobs extends StatelessWidget {
  MyJobs({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.055,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                AppText(
                  title: "My Jobs",
                  size: AppSizes.size_16,
                  fontFamily: AppFont.semi,
                  color: AppColor.blackDarkColor,
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(AddJobPost(),
                    transition: Transition.rightToLeft
                    );
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
                )

              ],
            ),
            SizedBox(
              height: Get.height * 0.004,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.004,
                    ),

                    ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Get.to(JobDetailPage());
                            },
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: Get.height*0.01),
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                  color:Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.15),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 2), // changes position of shadow
                                    ),
                                  ],


                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,
                                      vertical: Get.height*0.015
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                title: "Product Designer",
                                                size: AppSizes.size_13,
                                                fontFamily: AppFont.semi,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                              AppText(
                                                title: "California, USA",
                                                size: AppSizes.size_12,
                                                fontFamily: AppFont.regular,
                                                color: Colors.black.withOpacity(0.6),
                                              ),
                                            ],
                                          ),
                                          Icon(Icons.delete,
                                            color: Colors.red,
                                            size: Get.height*0.031,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: Get.height*0.007,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Row(
                                            children: [
                                              AppText(

                                                title: "\$150",
                                                size: AppSizes.size_14,
                                                fontFamily: AppFont.semi,
                                                color: AppColor.primaryColor,
                                              ),
                                              AppText(
                                                title: "/Mo",
                                                size: AppSizes.size_13,
                                                fontFamily: AppFont.regular,
                                                color: Colors.black.withOpacity(0.6),
                                              ),
                                            ],
                                          ),
                                          AppText(
                                            title: "25 minutes ago",
                                            size:Get.height*0.013,
                                            fontFamily: AppFont.regular,
                                            color: Colors.black.withOpacity(0.6),
                                          ),

                                        ],
                                      ),


                                      SizedBox(height: Get.height*0.007,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [

                                          Container(
                                            width:Get.width*0.29,
                                            height: Get.height*0.047,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey.withOpacity(0.6),width: 1.5),
                                                borderRadius: BorderRadius.circular(10),
                                                color: Color(0xfff2f0fe)
                                            ),
                                            child:  Center(
                                              child: AppText(
                                                title: "View Request",
                                                size: AppSizes.size_11,
                                                fontFamily: AppFont.medium,
                                                color: Colors.black,
                                              ),
                                            ) ,
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
