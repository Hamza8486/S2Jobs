
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/authentication/controller/auth_controller.dart';
import 'package:jobfind/app/authentication/login/component/phone_component.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/services/api_manager.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/util/toast.dart';
import 'package:jobfind/widgets/app_button.dart';
import 'package:jobfind/widgets/app_text.dart';

class AboutMe extends StatefulWidget {
   AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  final dashboardController = Get.put(HomeController());

  var des = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    des.text = dashboardController.aboutMe.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                height: Get.height* 0.03,
              ),
              AppText(
                title: "About Me",
                color: AppColor.blackColor,
                size: AppSizes.size_18,
                fontFamily: AppFont.semi,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              jobField(
                  hint: "Tell me about you",
                  max:7,
                  controller: des,
                textInputAction: TextInputAction.done
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Obx(
                () {
                  return

                  Get.put(AuthController()).isLoader.value?
                  Center(
                      child: SpinKitThreeBounce(
                          size: 25, color: AppColor.blackColor)
                  ):

                    AppButton(buttonName: "Save", buttonColor: AppColor.primaryColor, textColor: Colors.white, onTap: (){
                    if(validateAbout(context)){
                      Get.put(AuthController()).updateLoader(true);
                      ApiManger().aboutMeData(context: context,about: des.text);
                    }

                  },
                    buttonRadius: BorderRadius.circular(10),
                    buttonWidth: Get.width,
                  );
                }
              ),

            ],
          ),
        ),
      ),
    );
  }

  bool validateAbout(BuildContext context) {

    if (des.text.isEmpty) {
      flutterToast(msg: "Please enter something about");
      return false;
    }



    return true;
  }
}
