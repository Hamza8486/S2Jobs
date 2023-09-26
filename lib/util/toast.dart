import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jobfind/widgets/app_text.dart';
import 'package:shimmer/shimmer.dart';
import 'package:jobfind/util/theme.dart';




Future<bool?> flutterToast({msg}){
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 0,
      backgroundColor:Colors.black.withOpacity(0.8),
      textColor: Colors.red,
      fontSize: AppSizes.size_13
  );
}

Future<bool?> flutterToastLong({msg}){
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 0,
      backgroundColor:Colors.black.withOpacity(0.8),
      textColor: Colors.red,
      fontSize: AppSizes.size_13
  );
}

Future<bool?> flutterToastSuccess({msg}){
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 0,
      backgroundColor:Colors.black.withOpacity(0.8),
      textColor: Colors.green,

      fontSize: AppSizes.size_13
  );
}

Future<bool> showExit({context}) async{

  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Do you want to logout?",style: TextStyle(color: AppColor.blackColor,
                    fontFamily: "Roboto",
                  fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: const Text("No", style: TextStyle(color: Colors.black)),
                        )),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async{

                        },
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.primaryColor),
                        child:  Text("Yes",style: TextStyle(color: Colors.white),),
                      ),
                    ),


                  ],
                )
              ],
            ),
          ),
        );
      })


  ;}


Future<bool> showExit1({context}) async{

  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Do you want to logout?",style: TextStyle(color: AppColor.blackColor,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: const Text("No", style: TextStyle(color: Colors.black)),
                        )),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async{

                        },
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.primaryColor),
                        child:  Text("Yes",style: TextStyle(color: Colors.white),),
                      ),
                    ),


                  ],
                )
              ],
            ),
          ),
        );
      })


  ;}



Future<bool> deleteAddress({context,onTap}) async{

  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Do you want to delete?",style: TextStyle(color: AppColor.blackColor,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: const Text("No", style: TextStyle(color: Colors.black)),
                        )),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed:onTap,
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.primaryColor),
                        child:  Text("Yes",style: TextStyle(color: Colors.white),),
                      ),
                    ),


                  ],
                )
              ],
            ),
          ),
        );
      })


  ;}


Future<bool> showExitPopup(context ,index ,onChange) async{
  if(index==0){
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Do you want to exit?",style: TextStyle(color: AppColor.primaryColor,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: const Text("No", style: TextStyle(color: Colors.black)),
                          )),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async{




                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColor.primaryColor),

                          child:  Text("Yes",style: TextStyle(color: Colors.white),),
                        ),
                      ),


                    ],
                  )
                ],
              ),
            ),
          );
        });}
  else{
    onChange(0);
    return false;
  }
}

Widget loader(){
  return Column(
    children: [
      SizedBox(
        height: Get.height * 0.35,
      ),
      Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.black26,
            valueColor: AlwaysStoppedAnimation<Color>(
                AppColor.primaryColor //<-- SEE HERE

            ),
          )),
    ],
  );
}
Widget noData({double?height}){
  return Column(children: [
    SizedBox(height: height??Get.height * 0.35),
    SvgPicture.asset(
      "assets/images/notfound.svg",
      height: Get.height * 0.05,
    ),
    SizedBox(height: Get.height * 0.015),
    Center(
        child: AppText(
          title: "No Record Found",
          size: Get.height * 0.014,
          color: AppColor.blackColor,
          fontWeight: FontWeight.w600,
        )),
    SizedBox(height: Get.height * 0.01),
  ]);
}
Shimmer getShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: Colors.white,),
          height: 100,
          width: 100,

        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 18.0,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 14.0,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 14.0,
                color: Colors.white,
              ),
            ],
          ),
        )
      ],
    ),
  );
}getShimmerCatsAllLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(10)),
      width: Get.width,

    ),
  );
}


Future<bool> showExitPopupMain(context,onTap) async{

  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            height: Get.height*0.12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Do you want to logout?".tr,style: TextStyle(color: AppColor.primaryColor,
                      fontFamily: AppFont.medium
                  ),),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.primaryColor),
                        child:  Text("Yes".tr,style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child:  Text("No".tr, style: TextStyle(color: Colors.black)),
                        ))
                  ],
                )
              ],
            ),
          ),
        );

      });}
Future<bool> showExitPopupMain1(context,onTap) async{

  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            height: Get.height*0.12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Do you want to logout?".tr,style: TextStyle(color: AppColor.primaryColor,
                      fontFamily: AppFont.medium
                  ),),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.primaryColor),
                        child:  Text("Yes".tr,style: TextStyle(color:Colors.white),),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child:  Text("No".tr, style: TextStyle(color: Colors.black)),
                        ))
                  ],
                )
              ],
            ),
          ),
        );

      });}



Future<bool> showExitPopups(context ,index ,onChange) async{
  if(index==0){
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              height: Get.height*0.11,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Do you want to logout?",style: TextStyle(color: AppColor.primaryColor,
                      fontFamily: AppFont.medium
                  ),),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async{




                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColor.primaryColor),

                          child:  Text("Yes",style: TextStyle(color: Colors.white),),
                        ),
                      ),

                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: const Text("No", style: TextStyle(color: Colors.black)),
                          )),


                    ],
                  )
                ],
              ),
            ),
          );
        });}
  else{
    onChange(0);
    return false;
  }
}



Future<bool> showExitPopups1(context ,index ,onChange) async{
  if(index==0){
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              height: Get.height*0.11,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Do you want to logout?",style: TextStyle(color: AppColor.primaryColor,
                      fontFamily: AppFont.medium
                  ),),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async{




                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColor.primaryColor),

                          child:  Text("Yes",style: TextStyle(color: Colors.white),),
                        ),
                      ),

                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: const Text("No", style: TextStyle(color: Colors.black)),
                          )),


                    ],
                  )
                ],
              ),
            ),
          );
        });}
  else{
    onChange(0);
    return false;
  }
}