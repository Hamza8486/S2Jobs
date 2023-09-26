import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/authentication/login/login_view.dart';
import 'package:jobfind/app/home/home_view.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/widgets/app_text.dart';
import 'package:jobfind/widgets/helper_function.dart';




class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String id = "";


  @override
  void initState() {
    super.initState();

    HelperFunctions.getFromPreference("id").then((value) {
      setState(() {
        id = value;
      });

      print("Hamza");
      print(id.toString());
      moveToNext();
    });

  }

  void moveToNext() {

    Timer(const Duration(seconds:2), () {
      if (id != "") {
        Get.offAll(
            UserHome(),
            transition: Transition.cupertinoDialog
        );
      }

      else {
        Get.offAll(
            LoginView(),
            transition: Transition.cupertinoDialog
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Get.height*0.4,),
              Center(
                child: AppText(
                    title: "Job Portal",
                    color: AppColor.blackColor,
                    fontFamily: AppFont.semi,
                    fontWeight: FontWeight.w700,
                    size: AppSizes.size_18),
              ),


            ],
          ),
        ));
  }
}
