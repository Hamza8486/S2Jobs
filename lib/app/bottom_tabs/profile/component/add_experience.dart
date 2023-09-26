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

class AddExperience extends StatefulWidget {
   AddExperience({Key? key,this.type,this.expData}) : super(key: key);
  var type;
  var expData;

  @override
  State<AddExperience> createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  final dashboardController = Get.put(HomeController());

  var qualificationController = TextEditingController();
  var companyController = TextEditingController();
  var startController = TextEditingController();
  var endController = TextEditingController();
  var description = TextEditingController();

  String jobId ="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.type=="update"?
      (qualificationController.text = widget.expData.jobTitle.title,

    companyController.text = widget.expData.companyName,
    startController.text = widget.expData.startDate,
    endController.text = widget.expData.endDate==null?"":widget.expData.endDate,
    description.text = widget.expData.description,
    dashboardController.updatePosition(widget.expData.myPosition==true?"val":""),
    jobId =widget.expData.jobTitle.id.toString()
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

                  widget.type=="update"?"Update work experience":
                  "Add work experience",
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
                          textAuth(text: "Job Category",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          jobField(
                              hint: "Search job",
                              onTap: (){
                                Get.put(HomeController()).getDropData();
                                setState(() {
                                  Get.put(HomeController()).getJobCategory.clear();
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
                                                  Get.put(HomeController()).filterCategoryData(val);

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
                                                    itemCount:Get.put(HomeController()).getJobCategory.length,
                                                    itemBuilder:
                                                        (BuildContext
                                                    context,
                                                        int index) {
                                                      // final result = stores[index];

                                                      return GestureDetector(
                                                        onTap: () {
                                                          qualificationController.text=Get.put(HomeController()).getJobCategory[index].title.toString();
                                                          jobId = Get.put(HomeController()).getJobCategory[index].id.toString();
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
                                                                      title: Get.put(HomeController()).getJobCategory[index].title.toString(),
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
                          textAuth(text: "Company",color: Colors.transparent),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          jobField(
                              hint: "Company name",
                              controller: companyController,
                              textInputAction: TextInputAction.done
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          Obx(
                            () {
                              return GestureDetector(
                                onTap: (){
                                  if(dashboardController.currentPosition.value.isEmpty){
                                    dashboardController.updatePosition("val");
                                    setState(() {
                                      endController.clear();
                                    });

                                  }
                                  else{
                                    setState(() {
                                      endController.clear();
                                    });
                                    dashboardController.updatePosition("");
                                  }

                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        dashboardController.currentPosition.value.isEmpty?
                                        Icons.check_box_outline_blank:Icons.check_box,
                                      size: Get.height*0.026,
                                        color: AppColor.primaryColor,
                                      ),
                                      SizedBox(width: Get.width*0.02,),
                                      AppText(
                                        title: "This is my position now",
                                        color: AppColor.blackColor.withOpacity(0.6),
                                        size: AppSizes.size_13,
                                        fontFamily: AppFont.medium,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
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

                            Obx(
                              () {
                                return

                                  dashboardController.currentPosition.value.isEmpty?
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
                                ):SizedBox.shrink();
                              }
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
                      ApiManger().updateExperience(context: context,
                      expId: widget.expData.id.toString(),

                      id: jobId.toString(),
                        comp: companyController.text,
                        start: startController.text,
                        end: endController.text,
                        des: description.text
                      );
                    }

                  }:(){
                      if(validateExperience(context)){
                        dashboardController.updateProfloader(true);
                        ApiManger().createExperience(context: context,
                            id: jobId.toString(),
                            comp: companyController.text,
                            start: startController.text,
                            end: endController.text,
                            des: description.text
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
      flutterToast(msg: "Please select job category");
      return false;
    }
    if (companyController.text.isEmpty) {
      flutterToast(msg: "Please enter company name");
      return false;
    }

    if (startController.text.isEmpty) {
      flutterToast(msg: "Please select start date");
      return false;
    }

    if(  dashboardController.currentPosition.value.isEmpty){
      if (endController.text.isEmpty) {
        flutterToast(msg: "Please select end date");
        return false;
      }
      else{
        return true;
      }
    }




    return true;
  }
}
