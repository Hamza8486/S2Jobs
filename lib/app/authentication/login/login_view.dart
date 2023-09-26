import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/authentication/login/component/phone_component.dart';
import 'package:jobfind/app/authentication/otp/otp_screen.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/util/toast.dart';
import 'package:jobfind/widgets/app_button.dart';
import 'package:jobfind/widgets/app_text.dart';



class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  late String phoneNumber;
  String value = '+91';
  bool isAllCheck = false;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: size.height * .37,
              ),

              AppText(

                title: 'Welcome!',
                size: AppSizes.size_24,
                color: AppColor.blackColor,
                fontFamily: AppFont.semi,
                fontWeight: FontWeight.w600,
              ),


              AppText(

                title: 'Enter phone number to continue and we will send a verification to this number ',
                size: AppSizes.size_12,
                color: AppColor.greyLightColor,
                fontFamily: AppFont.medium,
                fontWeight: FontWeight.w500,
              ),


              SizedBox(
                height: size.height * .035,
              ),
              CountryCodeWid(
                onPickCode: (code) {
                  setState(() {
                    value = code.toString();
                  });
                },
                phoneController: phoneController,
              ),

              SizedBox(
                height: Get.height * 0.02,
              ),
              termsAndCondition(
                  color: isAllCheck == false
                      ? Colors.transparent
                      : AppColor.primaryColor,
                  color1: AppColor.primaryColor,
                  onTap: () {
                    if (isAllCheck == false) {
                      setState(() {
                        isAllCheck=true;
                      });

                    } else {
                      setState(() {
                        isAllCheck=false;
                      });
                    }
                  },
                  color2: isAllCheck == false
                      ? Colors.transparent
                      : Colors.white),


              SizedBox(
                height: size.height * .05,
              ),


              AppButton(
                buttonWidth: size.width,

                buttonRadius: BorderRadius.circular(10),

                buttonName: "LOGIN",

                fontWeight: FontWeight.w500,
                textSize: AppSizes.size_14,
                fontFamily: AppFont.medium,
                buttonColor: AppColor.primaryColor,

                textColor: AppColor.white,
                onTap: () {


                  if (validate()) {
                    if(isAllCheck==true){
                      Get.to(OtpScreen(
                        phone:value + phoneController.text ,
                      ));
                    }
                    else{
                      flutterToast(msg: "Please accept terms & conditions");
                    }



                  }
                },

              )

              ,


            ],
          ),
        ),
      ),
    );
  }

  bool validate() {
    phoneNumber = phoneController.text;
    if (phoneNumber.isEmpty) {

      flutterToast(msg:  "Phone number is required");

      return false;
    }
    if (phoneNumber.length<9) {

      flutterToast(msg:  "Please enter valid phone number");

      return false;
    }
    return true;
  }


}
