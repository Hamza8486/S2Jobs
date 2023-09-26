import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/authentication/login/component/phone_component.dart';
import 'package:jobfind/app/bottom_tabs/dashboard/component/filter_view.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/util/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jobfind/widgets/app_text.dart';

class JobList extends StatelessWidget {
  JobList({Key? key}) : super(key: key);

  final dashboardController = Get.put(HomeController());

  List catList = ["Designer", "Mobile Developer", "Web Developer", "Analytics"];

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primaryColor),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
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
                        color: Colors.white,
                        size: Get.height * 0.03,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  jobField(
                      hint: "Search Job",
                      color: Colors.white,
                      isPref: true,
                      textInputAction: TextInputAction.done,
                      child1: Icon(
                        Icons.search_outlined,
                        color: Colors.black.withOpacity(0.5),
                        size: Get.height * 0.03,
                      )),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  jobField(
                      hint: "Apply Filter",
                      color: Colors.white,
                      isPref: true,
                      isRead: true,
                      isCur: false,
                      onTap: (){
                        Get.to(ApplyFilter());
                      },
                      textInputAction: TextInputAction.done,
                      child1: Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.amber,
                        size: Get.height * 0.03,
                      )),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.015,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.03,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: Get.height * 0.052,
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            padding: EdgeInsets.zero,
                            itemCount: catList.length + 1,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return index == 0
                                  ? GestureDetector(
                                      onTap: () {
                                        print(index);

                                        dashboardController.updateName("all");
                                        dashboardController
                                            .updateDataHome("all");

                                        dashboardController
                                            .updateCategoryIndex(index);
                                      },
                                      child: Obx(() {
                                        return Card(
                                          margin: EdgeInsets.only(
                                              left: index == 0
                                                  ? 0
                                                  : Get.width * 0.01,
                                              right: Get.width * 0.01,
                                              top: 2,
                                              bottom: 2),
                                          color: dashboardController
                                                      .categoryIndex.value ==
                                                  index
                                              ? AppColor.primaryColor
                                              : AppColor.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          shadowColor: Colors.white,
                                          elevation: 2,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Get.width * 0.06),
                                            child: Center(
                                              child: AppText(
                                                title: "All",
                                                color: dashboardController
                                                            .categoryIndex
                                                            .value ==
                                                        index
                                                    ? Colors.white
                                                    : AppColor.blackColor,
                                                size: AppSizes.size_12,
                                                fontFamily: AppFont.medium,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        print(index);

                                        dashboardController
                                            .updateName(catList[index - 1]);
                                        dashboardController.updateDataHome("");

                                        dashboardController
                                            .updateCategoryIndex(index);
                                      },
                                      child: Obx(() {
                                        return Card(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: Get.width * 0.01,
                                              vertical: 2),
                                          color: dashboardController
                                                      .categoryIndex.value ==
                                                  index
                                              ? AppColor.primaryColor
                                              : AppColor.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          shadowColor: Colors.white,
                                          elevation: 2,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Get.width * 0.035),
                                            child: Center(
                                              child: AppText(
                                                title: catList[index - 1],
                                                color: dashboardController
                                                            .categoryIndex
                                                            .value ==
                                                        index
                                                    ? Colors.white
                                                    : AppColor.blackColor,
                                                size: AppSizes.size_12,
                                                fontFamily: AppFont.medium,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                            }),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      primary: false,
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding:  EdgeInsets.symmetric(vertical: Get.height*0.01),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset:
                                      Offset(0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.03,
                                  vertical: Get.height * 0.015),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            title: "Product Designer",
                                            size: AppSizes.size_12,
                                            fontFamily: AppFont.semi,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                          AppText(
                                            title: "California, USA",
                                            size: AppSizes.size_13,
                                            fontFamily: AppFont.regular,
                                            color: Colors.black.withOpacity(0.6),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.bookmark_border_outlined,
                                        color: Colors.black,
                                        size: Get.height*0.031,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.018,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                        size: Get.height * 0.013,
                                        fontFamily: AppFont.regular,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.018,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Center(
                                              child: AppText(
                                                title: "Senior",
                                                size: AppSizes.size_11,
                                                fontFamily: AppFont.medium,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.02,
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Center(
                                              child: AppText(
                                                title: "Part Time",
                                                size: AppSizes.size_11,
                                                fontFamily: AppFont.medium,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.02,
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColor.color3,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Center(
                                              child: AppText(
                                                title: "Apply",
                                                size: AppSizes.size_11,
                                                fontFamily: AppFont.medium,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
