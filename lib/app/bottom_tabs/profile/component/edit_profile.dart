import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jobfind/app/authentication/login/component/phone_component.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/services/api_manager.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/util/toast.dart';
import 'package:jobfind/widgets/app_button.dart';
import 'package:jobfind/widgets/app_text.dart';
import 'package:jobfind/widgets/bottom_sheet.dart';
import 'package:jobfind/widgets/helper_function.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final dashboardController = Get.put(HomeController());

  String? selectGender = "";
  String value = '+91';
  String?locationId;

  @override
  void initState() {
    super.initState();
    dashboardController.nameController.text=dashboardController.fullName.value;
    dashboardController.dateOfBirthController.text=dashboardController.profileModelData?.dob==null?"":(dashboardController.profileModelData?.dob).toString();
    dashboardController.emailController.text=dashboardController.profileModelData?.email==null?"":(dashboardController.profileModelData?.email).toString();
    dashboardController.locationController.text=dashboardController.profileModelData?.location==null?"":(dashboardController.profileModelData?.location?.title).toString();
    dashboardController.adharController.text=dashboardController.profileModelData?.adharNo==null?"":(dashboardController.profileModelData?.adharNo).toString();
    locationId = dashboardController.profileModelData?.location==null?"":(dashboardController.profileModelData?.location?.id).toString();
    selectGender = dashboardController.profileModelData?.gender==null?"":(dashboardController.profileModelData?.gender).toString();
    dashboardController.phoneController.text = extractPhoneNumber(dashboardController.phoneValue.value);


  }
  @override
  Widget build(BuildContext context) {
    print(dashboardController.profileModelData?.dob);
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Stack(
      children: [
        Scaffold(
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
                        height: Get.height * 0.01,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: Get.size.height * 0.12,
                              width: Get.size.height * 0.12,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000),
                                  border: Border.all(
                                      color: Colors.white, width: 1.5)),
                              child: Obx(
                                      () {
                                    return ClipRRect(
                                        borderRadius: BorderRadius.circular(1000),
                                        child:

                                        Get.find<HomeController>().imageFile!=null?
                                            Image.file(Get.find<HomeController>().imageFile as File,
                                            fit:  BoxFit.cover,
                                            ):
                                        CachedNetworkImage(
                                          imageUrl: Get.find<HomeController>().image.value,
                                          fit:
                                          dashboardController.nameUser.value.isEmpty?BoxFit.cover:

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

                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (builder) => bottomSheet(onCamera: () {
                                  Navigator.pop(context);
                                  HelperFunctions.pickImage(ImageSource.camera)
                                      .then((value) {
                                    setState(() {

                                      Get.find<HomeController>().imageFile = value!;
                                      ApiManger().editImage(context: context);

                                    });
                                  });
                                }, onGallery: () {
                                  Navigator.pop(context);
                                  HelperFunctions.pickImage(ImageSource.gallery)
                                      .then((value) {
                                    setState(() {
                                      Get.find<HomeController>().imageFile = value!;
                                      ApiManger().editImage(context: context);
                                    });
                                  });
                                }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.purple,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.height*0.012),
                              child: AppText(
                                title: "Change Image",
                                size: AppSizes.size_11,
                                fontFamily: AppFont.regular,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(
                      height: Get.height * 0.02,
                      ),
                      textAuth(text: "Full Name",color: Colors.transparent),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                   jobField(
                        hint: "Full name",
                        controller: dashboardController.nameController,
                     textInputAction: TextInputAction.done
                      ),
                          SizedBox(
                            height: Get.height * 0.015,
                          ),
                          textAuth(text: "Date of Birth",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          jobField(
                            hint: "08 august 1992",
                            controller: dashboardController.dateOfBirthController,
                            isSuffix: true,
                            isRead: true,
                            isCur: false,
                              onTap: () async{
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialEntryMode: DatePickerEntryMode.calendarOnly,

                                    builder: (BuildContext? context,
                                        Widget? child) {
                                      return Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            width: 350.0,
                                            height: 500.0,
                                            child: Theme(
                                              data: ThemeData.light().copyWith(
                                                primaryColor:
                                                AppColor.blackColor,

                                                colorScheme: ColorScheme.light(
                                                  primary:
                                                  AppColor.blackColor,),
                                                buttonTheme: ButtonThemeData(
                                                    buttonColor:
                                                    AppColor.primaryColor),
                                              ),
                                              child: child!,
                                            ),
                                          ));
                                    },
                                    initialDate: DateTime.now(),
                                    firstDate:DateTime(1950),
                                    lastDate: DateTime.now());

                                if (pickedDate != null) {
                                  dashboardController.dateOfBirthController.text =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                }
                              },
                            child: Icon(Icons.calendar_month,color: Colors.black,
                            size: Get.height*0.025,
                            )
                          ),

                      SizedBox(
                        height: Get.height * 0.015),
                          textAuth(text: "Email",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          jobField( validator: (value) => EmailValidator.validate(value!)
                              ? null
                              : "Please enter a valid email",
                            hint: "Example@gmail.com",
                            controller: dashboardController.emailController,
                          ),

                          SizedBox(
                            height: Get.height * 0.015,
                          ),
                          textAuth(text: "Gender",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Row(
                            children: [
                              Expanded(
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
                                    padding:  EdgeInsets.symmetric(vertical: Get.height*0.017,horizontal: Get.width*0.02),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              selectGender="Male";
                                            });
                                          },
                                          child: Icon(
                                            selectGender=="Male"?
                                            Icons.circle:Icons.circle_outlined,
                                            size: Get.height*0.026,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        SizedBox(width: Get.width*0.03,),
                                        AppText(
                                          title: "Male",
                                          size: AppSizes.size_12,
                                          fontFamily: AppFont.regular,
                                          color: AppColor.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: Get.width*0.08,),
                              Expanded(
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
                                    padding:  EdgeInsets.symmetric(vertical: Get.height*0.017,horizontal: Get.width*0.02),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              selectGender="Female";
                                            });
                                          },
                                          child: Icon(selectGender=="Female"?
                                          Icons.circle:Icons.circle_outlined,
                                          size: Get.height*0.026,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        SizedBox(width: Get.width*0.03,),
                                        AppText(
                                          title: "Female",
                                          size: AppSizes.size_12,
                                          fontFamily: AppFont.regular,
                                          color: AppColor.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.015,
                          ),
                          textAuth(text: "Phone Number",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          CountryCodeWid(
                            onPickCode: (code) {
                              setState(() {
                                value = code.toString();
                              });
                            },

                            child: SizedBox.shrink(),
                            color: Colors.white,
                            color1: FontWeight.w500,
                            phoneController: dashboardController.phoneController,
                          ),
                          SizedBox(
                              height: Get.height * 0.015),
                          textAuth(text: "Location",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          jobField(
                            hint: "California, USA",
                            onTap: (){
                              Get.put(HomeController()).getDropData();
                             setState(() {
                               Get.put(HomeController()).getLocation.clear();
                             });
                              Get.defaultDialog(
                                  title: "",
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: Get.width*0.012),
                                  titlePadding: EdgeInsets.zero,
                                  content: SizedBox(
                                    height: Get.height * 0.38,
                                    width: Get.width*0.7,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: Get.height * 0.049,
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal:Get.width*0.02 ),
                                            child: TextFormField(
                                              onChanged: (val) {
                                                Get.put(HomeController()).filterLocationData(val);

                                              },

                                              style: TextStyle(

                                                fontSize:13,
                                                color: AppColor.black,
                                              ),
                                              decoration: InputDecoration(
                                                hintStyle: TextStyle(
                                                  color:   AppColor.black,
                                                  fontSize: 12,

                                                ),
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 10),
                                                hintText:"Search location",
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: AppColor.black
                                                        .withOpacity(0.7),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: AppColor.black
                                                        .withOpacity(0.7),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                                disabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: AppColor.black
                                                        .withOpacity(0.7),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: Get.height * 0.015),
                                        Expanded(child: Obx(
                                                () {
                                              return
                                                Get.put(HomeController()).dropLoader.value?
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                      Get.height *
                                                          0.14,
                                                    ),
                                                    const Center(
                                                        child:
                                                        CircularProgressIndicator(
                                                          color: AppColor
                                                              .primaryColor,
                                                        )),
                                                  ],
                                                ):
                                                ListView.builder(
                                                  shrinkWrap:
                                                  Get.put(HomeController()).nameUser.isEmpty?true:
                                                  true,
                                                  itemCount:Get.put(HomeController()).getLocation.length,
                                                  itemBuilder:
                                                      (BuildContext
                                                  context,
                                                      int index) {
                                                    // final result = stores[index];

                                                    return GestureDetector(
                                                      onTap: () {
                                                        dashboardController.locationController.text=Get.put(HomeController()).getLocation[index].title.toString();
                                                        locationId = Get.put(HomeController()).getLocation[index].id.toString();
                                                        Get.back();
                                                        setState(() {

                                                        });

                                                      },
                                                      child:
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            vertical:
                                                            6,
                                                            horizontal:
                                                            10),
                                                        child:
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.location_on_sharp,
                                                                  size:
                                                                  Get.height * 0.023,
                                                                  color: Colors.amber,
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                  Get.width * 0.01,
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                  Get.width * 0.48,
                                                                  child: AppText(
                                                                    title: Get.put(HomeController()).getLocation[index].title.toString(),
                                                                    size:AppSizes.size_12,
                                                                    maxLines: 2,
                                                                    color: AppColor.black.withOpacity(0.9),
                                                                    fontFamily: AppFont.medium,

                                                                    textAlign: TextAlign.justify,),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(height: 2,),
                                                            Divider(color: AppColor.primaryColor.withOpacity(0.4),),
                                                            SizedBox(height: 2,),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                            }
                                        ))




                                      ],
                                    ),
                                  ));
                            },
                            isRead: true,
                            isCur: false,
                            textInputAction: TextInputAction.done,
                            controller: dashboardController.locationController,
                          ),
                          SizedBox(
                              height: Get.height * 0.015),
                          textAuth(text: "Adhaar No.",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          jobField(
                            hint: "Adhaar No.",
                            textInputAction: TextInputAction.done,
                            controller: dashboardController.adharController,
                          ),
                          SizedBox(
                              height: Get.height * 0.015),
                          textAuth(text: "Upload Adhar image",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (builder) => bottomSheet(onCamera: () {
                                    Navigator.pop(context);
                                    HelperFunctions.pickImage(ImageSource.camera)
                                        .then((value) {
                                      setState(() {
                                        Get.find<HomeController>().adharFile = value!;
                                      });
                                    });
                                  }, onGallery: () {
                                    Navigator.pop(context);
                                    HelperFunctions.pickImage(ImageSource.gallery)
                                        .then((value) {
                                      setState(() {
                                        Get.find<HomeController>().adharFile = value!;
                                      });
                                    });
                                  }));
                            },
                            child: Container(height: Get.height*0.15,
                            width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColor.primaryColor,
                                width: 1.5
                                ),
                              ),
                              child:
                              dashboardController.adharFile==null?
                              Obx(
                                () {
                                  return
                                    Get.put(HomeController()).imageAdhaar.value.isEmpty?

                                    Center(
                                    child: Icon(Icons.image,color: Colors.black,
                                    size: Get.height*0.03,
                                    ),
                                  ):
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(1000),
                                        child:

                                        CachedNetworkImage(
                                          imageUrl: Get.find<HomeController>().imageAdhaar.value,
                                          fit:
                                          dashboardController.nameUser.value.isEmpty?BoxFit.cover:

                                          BoxFit.cover,
                                          placeholder: (context, url) =>  const Center(
                                            child: SpinKitThreeBounce(
                                                size: 18, color:Colors.amber),
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
                              ):
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(dashboardController.adharFile as File,
                                fit: BoxFit.cover,
                                ),
                              )
                              ,
                            ),
                          )

                        ],
                      ),
                    ),
                  )),

              SizedBox(
                height: Get.height * 0.01,
              ),
              isKeyBoard?SizedBox.shrink():
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                child:   AppButton(buttonName: "Update", buttonColor: AppColor.primaryColor, textColor: Colors.white, onTap: (){
                  if(validateProfile(context)){
                    Get.put(HomeController()).updateProfloader(true);
                    ApiManger().editProfile(context: context,
                      location: locationId.toString(),
                      gender: selectGender.toString(),


                    );
                  }

                },
                  buttonRadius: BorderRadius.circular(10),
                  buttonWidth: Get.width,
                )
              ),
              isKeyBoard?SizedBox.shrink():
              SizedBox(
                height: Get.height * 0.01,
              ),



            ],
          ),
        ),
        Obx(() {
          return Get.put(HomeController()).updateProfileLoader.value == false
              ? SizedBox.shrink()
              : Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black26,
            child:  Center(
                child: SpinKitThreeBounce(
                    size: 25, color: AppColor.blackColor)
            ),
          );



        })
      ],
    );
  }

  bool validateProfile(BuildContext context) {

    if (dashboardController.nameController.text.isEmpty) {
      flutterToast(msg: "Please enter name");
      return false;
    }
    if (dashboardController.dateOfBirthController.text.isEmpty) {
      flutterToast(msg: "Please select date of birth");
      return false;
    }
    if (selectGender=="") {
      flutterToast(msg: "Please select gender");
      return false;
    }
    if (dashboardController.locationController.text.isEmpty) {
      flutterToast(msg: "Please enter location");
      return false;
    }
    if (dashboardController.adharController.text.isEmpty) {
      flutterToast(msg: "Please enter adhaar no");
      return false;
    }
    if(dashboardController.imageAdhaar.value.isEmpty){
      if (dashboardController.adharFile==null) {
        flutterToast(msg: "Please upload adhaar pic");
        return false;
      }
      else{
        return true;
      }
    }




    return true;
  }
  String extractPhoneNumber(String phoneNumber) {
    // Check if the phone number starts with "+91".
    if (phoneNumber.startsWith("+91")) {
      // If it does, extract the part after "+91".
      return phoneNumber.substring(3);
    } else {
      // If not, return the original phone number or handle the error as needed.
      return phoneNumber;
    }
  }
}
