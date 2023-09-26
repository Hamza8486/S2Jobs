import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/bottom_tabs/profile/component/about.dart';
import 'package:jobfind/app/bottom_tabs/profile/component/edit_profile.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/widgets/app_text.dart';


Widget profileWidget({name,onTap,image}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: Get.width,
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
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,
            vertical: Get.height*0.018
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset( image,
                  height: Get.height*0.026,
                ),
                SizedBox(width: Get.width*0.03,),
                AppText(
                  title: name.toString(),
                  size: AppSizes.size_13,
                  fontFamily: AppFont.semi,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackDarkColor,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.ORANGE.withOpacity(0.1),
                  shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Icon(Icons.add,
                  color: AppColor.ORANGE,
                  size: Get.height*0.02,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}


Widget imageWidget(){
  return Container(
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
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.size.height * 0.07,
                  width: Get.size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      border: Border.all(
                          color: Colors.white, width: 1.5)),
                  child: Obx(
                          () {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: CachedNetworkImage(
                              imageUrl:Get.put(HomeController()).image.value,
                              fit:
                              Get.put(HomeController()).nameUser.value.isEmpty?BoxFit.cover:

                              BoxFit.cover,
                              placeholder: (context, url) =>  const Center(
                                child: SpinKitThreeBounce(
                                    size: 18, color: Colors.amber),
                              ),
                              errorWidget: (context, url, error) => ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset(
                                  "assets/images/person.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ));
                      }
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.find<HomeController>().clearField();
                    Get.to(EditProfile());
                  },
                  child: Container(
                    color: Colors.transparent,
                    child:  Image.asset( "assets/images/edit.png",
                      height: Get.height*0.03,
                      color: AppColor.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Obx(
            () {
              return AppText(
                title:
                Get.put(HomeController()).fullName.isEmpty?"User Name":
                Get.put(HomeController()).fullName.value,
                size: AppSizes.size_15,
                fontFamily: AppFont.medium,
                color: AppColor.white,
              );
            }
          ),
          Obx(
            () {
              return
                Get.put(HomeController()).fullName.isEmpty?SizedBox.shrink():

                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.001,
                  ),
                  SizedBox(
                    width:Get.width*0.75,
                    child: AppText(
                      title: (Get.put(HomeController()).profileModelData?.location?.title).toString(),
                      size: AppSizes.size_13,
                      maxLines: 1,
                      overFlow: TextOverflow.ellipsis,
                      fontFamily: AppFont.regular,
                      color: AppColor.white,
                    ),
                  ),
                ],
              );
            }
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
        ],
      ),
    ),
  );
}


Widget aboutWidget({onTap,text}){
  return   Container(
    width: Get.width,
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
      padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,
          vertical: Get.height*0.018
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset( "assets/images/user.png",
                    height: Get.height*0.026,
                    color: AppColor.ORANGE,
                  ),
                  SizedBox(width: Get.width*0.03,),
                  AppText(
                    title: "About Me",
                    size: AppSizes.size_13,
                    fontFamily: AppFont.semi,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackDarkColor,
                  ),
                ],
              ),
              Obx(
                () {
                  return
                    Get.put(HomeController()).aboutMe.value.isEmpty?

                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.ORANGE.withOpacity(0.1),
                            shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(Icons.add,
                            color: AppColor.ORANGE,
                            size: Get.height*0.02,
                          ),
                        ),
                      ),
                    )
                        :

                    GestureDetector(
                    onTap: onTap,
                    child: Image.asset( "assets/images/edit.png",
                      height: Get.height*0.028,
                      color: AppColor.ORANGE,
                    ),
                  );
                }
              ),
            ],
          ),
         Obx(
           () {
             return
               Get.put(HomeController()).aboutMe.value.isEmpty?SizedBox.shrink():

               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: Get.height*0.007,),
                 Divider(color: AppColor.borderColorField,
                   thickness: 1.5,
                 ),
                 SizedBox(height: Get.height*0.007,),
                 AppText(
                   title: Get.put(HomeController()).aboutMe.value,
                   size: AppSizes.size_12,
                   maxLines: 3,
                   fontFamily: AppFont.regular,

                   color: Colors.black.withOpacity(0.6),
                 ),
               ],
             );
           }
         )
        ],
      ),
    ),
  );
}