import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/authentication/controller/auth_controller.dart';
import 'package:jobfind/services/api_manager.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/util/toast.dart';
import 'package:jobfind/widgets/app_button.dart';
import 'package:jobfind/widgets/app_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key, this.phone,})
      : super(key: key);

  var phone;

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {


  TextEditingController textEditingController1 = TextEditingController();



  late AuthCredential _phoneAuthCredential;
  final otpController = TextEditingController();

  late User _firebaseUser;
  String? _verificationCode;

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phone.toString(),
      verificationCompleted: (PhoneAuthCredential credential) async {
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        flutterToast(msg: e.message);
      },
      codeSent: (String verificationID, int? resendToken) {
        setState(() {
          _verificationCode = verificationID;
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        if(mounted){
          setState(() {
            _verificationCode = verificationID;
          });
        }
      },
      timeout: Duration(seconds: 120),
    );
  }

  bool isLoading = false;

  String currentText = "";
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  final formKey = GlobalKey<FormState>();
  String ? token;

  void getToken() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    print("token");
    print(token);
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      if (mounted) {
        _startTimer();
        _verifyPhone();
      }
    });
    textEditingController1 = TextEditingController();
    getToken();

  }


  Timer? _timer;
  int _counter = 120;

  bool isShowResend = false;
  void _startTimer() {
    setState(() {
      isShowResend = true;
    });
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec, (Timer timer) => setState(() {
      if(_counter>0){
        _counter--;
      }else{
        _timer?.cancel();
        _counter = 120;
        setState(() {
          isShowResend = false;
        });
      }
    }),
    );
  }
  formatedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }
  @override
  Widget build(BuildContext context) {
    print(widget.phone.toString());
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width*0.04),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.07,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: backButton(

                  onTap: () {
                    Get.back();
                  }),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .05,
                    ),
                    AppText(
                      title: "Verify Your Otp",
                      size: size.height * 0.023,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                      fontFamily:AppFont.semi,
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Center(
                      child: AppText(
                        title: "Enter OTP that we have sent your mobile\n number",
                        size: AppSizes.size_12,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w700,
                        color: AppColor.black,
                        fontFamily: AppFont.regular,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .06,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05),
                      child: PinCodeTextField(
                        appContext: context,
                        autoDisposeControllers: false,
                        length: 6,
                        animationType: AnimationType.fade,
                        // validator: (v) {
                        //   if (v!.length < 5) {
                        //     //return "Please enter valid otp";
                        //     return "Пожалуйста, введите правильный код";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          activeColor: AppColor.primaryColor,
                          inactiveColor: AppColor.greyColor,
                          inactiveFillColor: AppColor.white,
                          activeFillColor: AppColor.white,
                          selectedFillColor: AppColor.white,
                          selectedColor: AppColor.primaryColor,
                          disabledColor: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        cursorColor: AppColor.primaryColor,
                        animationDuration:
                        const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController1,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          return true;
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),


                    Obx(
                      () {
                        return
                          Get.put(AuthController()).isLoader.value?
                          Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: AppColor.primaryColor.withOpacity(0.4),
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                      AppColor.primaryColor ),
                                ),
                              ):

                          AppButton(
                          buttonWidth: size.width,
                          buttonRadius: BorderRadius.circular(10),

                          buttonName: "Verify",
                          fontWeight: FontWeight.w500,
                          textSize: AppSizes.size_14,
                          fontFamily: AppFont.medium,
                          buttonColor: AppColor.primaryColor,

                          textColor: AppColor.white,
                          onTap: () async{


                            if (currentText != null &&
                                currentText.length == 6) {
                              Get.put(AuthController()).updateLoader(true);
                              try{
                                await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(
                                    verificationId: _verificationCode.toString(), smsCode: currentText)).then((value) {
                                  if(value.user!=null){
                                    print("object");
                                    ApiManger().loginResponse(context: context,
                                    phone: widget.phone.toString(),deviceToken: token.toString()
                                    );


                                  }
                                });
                              }catch(e){
                                isLoading=false;
                                Get.put(AuthController()).updateLoader(false);
                                print("error $e");
                              }


                            }
                            else{
                              Get.put(AuthController()).updateLoader(false);

                            }


                          },
                        );
                      }
                    ),







                    //     :Center(
                    //   child: CircularProgressIndicator(
                    //     backgroundColor: AppColor.primaryColor.withOpacity(0.4),
                    //     valueColor: AlwaysStoppedAnimation<Color>(
                    //         AppColor.primaryColor ),
                    //   ),
                    // ),


                    SizedBox(height: Get.height*0.038,),



                    isShowResend == false?
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _startTimer();
                          _verifyPhone();
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              title:"Didn’t receive code?  ",
                              size: AppSizes.size_13,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                              color: AppColor.greyColor,
                              fontFamily:AppFont.medium,
                            ),
                            AppText(
                              title:"Resend ",
                              size: AppSizes.size_14,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppFont.semi,
                              color: AppColor.black,

                            ),
                          ],
                        ),
                      ),
                    )


                        : Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Center(child:
                      AppText(title: '${formatedTime(timeInSecond: _counter)}', size: 14, color: AppColor.primaryColor,

                        fontWeight: FontWeight.w700,
                        fontFamily: AppFont.medium,
                      )
                      ),
                    )
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
