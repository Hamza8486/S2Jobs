import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/bottom_tabs/dashboard/component/job_detail.dart';
import 'package:jobfind/app/bottom_tabs/dashboard/component/job_list.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/util/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jobfind/widgets/app_text.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());
  List<String> staticBannerList = [
    'https://www.shutterstock.com/image-photo/live-inplay-betting-app-on-600w-2177823557.jpg',
    'https://www.shutterstock.com/image-photo/live-inplay-betting-app-on-600w-2162707191.jpg',
    'https://www.shutterstock.com/image-photo/live-inplay-betting-app-on-600w-2177823557.jpg',
    // Add more banner URLs as needed
  ];

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.055,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: "Hello!",
                      size: AppSizes.size_16,
                      fontFamily: AppFont.medium,
                      color: AppColor.primaryColor,
                    ),
                    Obx(() {
                      return AppText(
                        title: homeController.name.value.isEmpty
                            ? "Hamza Sabir"
                            : "${homeController.name.value}",
                        size: AppSizes.size_16,
                        fontFamily: AppFont.semi,
                        color: AppColor.primaryColor,
                      );
                    }),
                  ],
                ),
                Container(
                  height: Get.height*0.045,
                  width:Get.height*0.045 ,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black,width: 1.5)
                  ),
                  child: Center(
                    child: AppText(
                      title: "₹",
                      size: AppSizes.size_17,
                      fontFamily: AppFont.semi,
                      color: Colors.black,
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
                      height: Get.height * 0.01,
                    ),
                    CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        pageSnapping: false,
                        height: Get.height * 0.17,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        pauseAutoPlayInFiniteScroll: false,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration: const Duration(milliseconds: 400),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {

                        },
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: staticBannerList
                          .map((item) => GestureDetector(
                        onTap:
                            (){

                        },
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              placeholder: (context, url) => const Center(
                                child: SpinKitThreeBounce(
                                    size: 18,
                                    color: AppColor.primaryColor
                                ),
                              ),
                              imageUrl: "https://img.freepik.com/free-photo/we-are-hiring-digital-collage_23-2149667034.jpg?w=826&t=st=1695455400~exp=1695456000~hmac=babf0c5569ee61e6f05cade6b805be7676216e90c95b8a64779a7041c54f1277",

                              width: Get.width,
                              fit: BoxFit.cover,

                              errorWidget: (context, url, error) => ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/we-are-hiring-digital-collage_23-2149667034.jpg?w=826&t=st=1695455400~exp=1695456000~hmac=babf0c5569ee61e6f05cade6b805be7676216e90c95b8a64779a7041c54f1277",
                                  fit: BoxFit.cover,
                                  width: Get.width,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                          .toList(),
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    AppText(
                      title: "Find Your Job",
                      size: AppSizes.size_15,
                      fontFamily: AppFont.semi,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: Get.height * 0.013,
                    ),
                    Row(
                      children: [
                        Expanded(child: GestureDetector(
                          onTap: (){
                            Get.to(JobList());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.color1,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            height: Get.height*0.23,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/job.png",
                              height: Get.height*0.04,
                              ),
                              SizedBox(height: Get.height*0.007,),
                              AppText(
                                title: "44.5k",
                                size: AppSizes.size_15,
                                fontFamily: AppFont.semi,
                                color: Colors.black,
                              ),

                              AppText(
                                title: "Remote Job",
                                size: AppSizes.size_13,
                                fontFamily: AppFont.medium,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          ),
                        )),
                        SizedBox(width: Get.width*0.05,),
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)
                          ),
                            height: Get.height*0.23,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width:Get.width,
                                decoration: BoxDecoration(
                                    color: AppColor.color2,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                      title: "48.5k",
                                      size: AppSizes.size_15,
                                      fontFamily: AppFont.semi,
                                      color: Colors.black,
                                    ),

                                    AppText(
                                      title: "Full Time",
                                      size: AppSizes.size_13,
                                      fontFamily: AppFont.medium,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height*0.02,),
                            Expanded(
                              child: Container(
                                width:Get.width,
                                decoration: BoxDecoration(
                                    color: AppColor.color3,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                      title: "30.5k",
                                      size: AppSizes.size_15,
                                      fontFamily: AppFont.semi,
                                      color: Colors.black,
                                    ),

                                    AppText(
                                      title: "Part Time",
                                      size: AppSizes.size_13,
                                      fontFamily: AppFont.medium,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    AppText(
                      title: "Recent Job List",
                      size: AppSizes.size_15,
                      fontFamily: AppFont.semi,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
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
                                      Icon(Icons.bookmark_border_outlined,
                                      color: Colors.black,
                                        size: Get.height*0.031,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: Get.height*0.018,),
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


                                  SizedBox(height: Get.height*0.018,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child:  Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Center(
                                              child: AppText(
                                                title: "Senior",
                                                size: AppSizes.size_11,
                                                fontFamily: AppFont.medium,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ) ,
                                        ),
                                      ),
                                      SizedBox(width: Get.width*0.02,),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child:  Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Center(
                                              child: AppText(
                                                title: "Part Time",
                                                size: AppSizes.size_11,
                                                fontFamily: AppFont.medium,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ) ,
                                        ),
                                      ),
                                      SizedBox(width: Get.width*0.02,),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColor.color3,
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child:  Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Center(
                                              child: AppText(
                                                title: "Apply",
                                                size: AppSizes.size_11,
                                                fontFamily: AppFont.medium,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ) ,
                                        ),
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
