import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobfind/app/authentication/login/component/phone_component.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/services/api_manager.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/util/toast.dart';
import 'package:jobfind/widgets/app_button.dart';
import 'package:jobfind/widgets/app_text.dart';

class AddEducation extends StatefulWidget {
   AddEducation({Key? key,this.type,this.eduData}) : super(key: key);
  var type;
  var eduData;

  @override
  State<AddEducation> createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  final dashboardController = Get.put(HomeController());

  var qualificationController = TextEditingController();
  var companyController = TextEditingController();
  var startController = TextEditingController();
  var endController = TextEditingController();
  var description = TextEditingController();
  var subjectType = TextEditingController();
  String eduId="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.type=="update"?
    (qualificationController.text = widget.eduData.educationTitle.title,

        companyController.text = widget.eduData.instituteName,
        subjectType.text = widget.eduData.fieldStudy,
        startController.text = widget.eduData.startDate,
        endController.text = widget.eduData.endDate==null?"":widget.eduData.endDate,
    description.text = widget.eduData.description,

    eduId =widget.eduData.educationTitle.id.toString()
    ):null;

  }

  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Stack(
      children: [
        Scaffold(
          body: Padding(
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
                  height: Get.height* 0.02,
                ),
                AppText(
                  title:
                  widget.type=="update"?"Update education":
                  "Add education",
                  color: AppColor.blackColor,
                  size: AppSizes.size_18,
                  fontFamily: AppFont.semi,
                ),
                SizedBox(
                  height: Get.height* 0.01,
                ),
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          textAuth(text: "Qualification",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          jobField(
                              hint: "Search qualification",
                              onTap: (){
                                Get.put(HomeController()).getDropData();
                                setState(() {
                                  Get.put(HomeController()).getEducation.clear();
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
                                                  Get.put(HomeController()).filterEducationData(val);

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
                                                  hintText:"Search here",
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
                                                    itemCount:Get.put(HomeController()).getEducation.length,
                                                    itemBuilder:
                                                        (BuildContext
                                                    context,
                                                        int index) {
                                                      // final result = stores[index];

                                                      return GestureDetector(
                                                        onTap: () {
                                                          qualificationController.text=Get.put(HomeController()).getEducation[index].title.toString();
                                                          eduId = Get.put(HomeController()).getEducation[index].id.toString();
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
                                                                      title: Get.put(HomeController()).getEducation[index].title.toString(),
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

                              controller: qualificationController,
                              textInputAction: TextInputAction.done
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Institution name",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          jobField(
                              hint: "Institution name",
                              controller: companyController,
                              textInputAction: TextInputAction.done
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textAuth(text: "Field of study",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          jobField(
                              hint: "e.g Computer Science",
                              controller: subjectType,
                              textInputAction: TextInputAction.done
                          ),

                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textAuth(text: "Start Date",color: Colors.transparent),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    jobField(
                                        hint: "Start date",
                                        controller: startController,
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
                                            startController.text =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                          }
                                        },
                                        child: Icon(Icons.calendar_month,color: Colors.black,
                                          size: Get.height*0.025,
                                        )
                                    ),
                                  ],
                                ),
                              ),
                              Obx(
                                      () {
                                    return
                                      dashboardController.currentPosition.value.isEmpty?

                                      SizedBox(width: Get.width*0.03,):SizedBox.shrink();
                                  }
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textAuth(text: "End Date",color: Colors.transparent),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    jobField(
                                        hint: "End date",
                                        controller: endController,
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
                                            endController.text =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                          }
                                        },
                                        child: Icon(Icons.calendar_month,color: Colors.black,
                                          size: Get.height*0.025,
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),


                          SizedBox(
                              height: Get.height * 0.015),
                          textAuth(text: "Description",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          jobField(
                            hint: "Write additional information here",
                            textInputAction: TextInputAction.done,
                            max: 5,
                            controller: description,
                          ),



                        ],
                      ),
                    )),

                SizedBox(
                  height: Get.height * 0.01,
                ),
                isKeyBoard?SizedBox.shrink():
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                  child: AppButton(buttonName: "Add", buttonColor: AppColor.primaryColor, textColor: Colors.white, onTap:
                  widget.type=="update"?
                      (){
                    if(validateExperience(context)){
                      dashboardController.updateProfloader(true);
                      ApiManger().updateEducationData(context: context,
                          eduId: widget.eduData.id.toString(),
                          field: subjectType.text,

                          id: eduId.toString(),
                          comp: companyController.text,
                          start: startController.text,
                          end: endController.text,
                          des: description.text
                      );
                    }

                  }:(){
                    if(validateExperience(context)){
                      dashboardController.updateProfloader(true);
                      ApiManger().createEducation(context: context,
                          id: eduId.toString(),
                          comp: companyController.text,
                          start: startController.text,
                          end: endController.text,
                          des: description.text,
                        field: subjectType.text,
                      );
                    }

                  },
                    buttonRadius: BorderRadius.circular(10),
                    buttonWidth: Get.width,
                  ),
                ),
                isKeyBoard?SizedBox.shrink():
                SizedBox(
                  height: Get.height * 0.01,
                ),



              ],
            ),
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

  bool validateExperience(BuildContext context) {

    if (qualificationController.text.isEmpty) {
      flutterToast(msg: "Please select qualification");
      return false;
    }
    if (companyController.text.isEmpty) {
      flutterToast(msg: "Please enter institute name");
      return false;
    }
    if (subjectType.text.isEmpty) {
      flutterToast(msg: "Please enter field of study");
      return false;
    }

    if (startController.text.isEmpty) {
      flutterToast(msg: "Please select start date");
      return false;
    }
    if (endController.text.isEmpty) {
      flutterToast(msg: "Please select end date");
      return false;
    }




    return true;
  }
}
