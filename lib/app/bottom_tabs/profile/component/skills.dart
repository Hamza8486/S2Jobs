import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/authentication/login/component/phone_component.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/widgets/app_button.dart';
import 'package:jobfind/widgets/app_text.dart';

class AddSkills extends StatefulWidget {
  const AddSkills({Key? key}) : super(key: key);

  @override
  State<AddSkills> createState() => _AddSkillsState();
}

class _AddSkillsState extends State<AddSkills> {
  final dashboardController = Get.put(HomeController());

  var qualificationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
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
              title: "Skill",
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
                      jobField(
                          hint: "Search ",
                          onTap: (){
                            Get.defaultDialog(
                                title: "",
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: Get.width*0.012),
                                titlePadding: EdgeInsets.zero,
                                content: SizedBox(
                                  height: Get.height * 0.45,
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
                                              hintText:"Search skills",
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
                                              // controller.countryLoader.value?
                                              // Column(
                                              //   children: [
                                              //     SizedBox(
                                              //       height:
                                              //       Get.height *
                                              //           0.08,
                                              //     ),
                                              //     Center(
                                              //         child:
                                              //         CircularProgressIndicator(
                                              //           color: AppColors
                                              //               .Purple_Color,
                                              //         )),
                                              //   ],
                                              // ):
                                              ListView.builder(
                                                shrinkWrap:
                                                Get.put(HomeController()).nameUser.isEmpty?true:
                                                true,
                                                itemCount:13,
                                                itemBuilder:
                                                    (BuildContext
                                                context,
                                                    int index) {
                                                  // final result = stores[index];

                                                  return GestureDetector(
                                                    onTap: () {
                                                      Get.back();

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
                                                                Icons.check_box_outline_blank,
                                                                size: Get.height*0.026,
                                                                color: AppColor.primaryColor,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                Get.width * 0.02,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                Get.width * 0.48,
                                                                child: AppText(
                                                                  title: "Leadership",
                                                                  size:AppSizes.size_13,
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
                        height: Get.height * 0.03,
                      ),
                      GridView.builder(

                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: Get.width/Get.height*8,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                          itemCount:4,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.02),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      title: "TeamWork",
                                      color: AppColor.blackColor,
                                      size: AppSizes.size_13,
                                      fontFamily: AppFont.regular,
                                    ),
                                    Icon(Icons.cancel_outlined,
                                    color: Colors.black,
                                      size: Get.height*0.023,
                                    )
                                  ],
                                ),
                              ),
                            );
                          })



                    ],
                  ),
                )),

            SizedBox(
              height: Get.height * 0.01,
            ),
            isKeyBoard?SizedBox.shrink():
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
              child: AppButton(buttonName: "Save", buttonColor: AppColor.primaryColor, textColor: Colors.white, onTap: (){


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
    );
  }


}
