import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/bottom_tabs/profile/component/about.dart';
import 'package:jobfind/app/bottom_tabs/profile/component/component.dart';
import 'package:jobfind/app/bottom_tabs/profile/component/education_list.dart';
import 'package:jobfind/app/bottom_tabs/profile/component/experience_list.dart';
import 'package:jobfind/app/bottom_tabs/profile/component/language.dart';
import 'package:jobfind/app/bottom_tabs/profile/component/skills.dart';
import 'package:jobfind/app/bottom_tabs/profile/component/upload_doc.dart';
import 'package:jobfind/app/bottom_tabs/profile/component/upload_resume.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  final dashboardController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageWidget(),
          Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      aboutWidget(

                      onTap: (){

                        Get.to(AboutMe(),
                            transition: Transition.rightToLeft
                        );
                      }
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),

                      profileWidget(name: "Work Experience",
                      image: "assets/images/work.png",
                      onTap: (){
                        dashboardController.getAllExpData();
                        Get.to(ExperienceList(),
                            transition: Transition.rightToLeft
                        );

                      }
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      profileWidget(name: "Education",
                          image: "assets/images/mortarboard.png",
                          onTap: (){
                        dashboardController.getEduAllData();
                            Get.to(EducationList(),
                                transition: Transition.rightToLeft
                            );
                          }
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      profileWidget(name: "Skills",
                          image: "assets/images/skills.png",
                          onTap: (){
                            Get.to(AddSkills(),
                                transition: Transition.rightToLeft
                            );
                          }),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      profileWidget(name: "Language",
                          image: "assets/images/lang.png",
                          onTap: (){

                            Get.to(AddLanguage(),
                                transition: Transition.rightToLeft
                            );
                          }),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      profileWidget(name: "Certificates/Documents",
                          image: "assets/images/appre.png",
                          onTap: (){

                        Get.to(UploadDocuments(),
                            transition: Transition.rightToLeft
                            );
                          }),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      profileWidget(name: "Resume",
                          image: "assets/images/resume.png",
                          onTap: (){
                        Get.to(ResumeUpload(),

                        transition: Transition.rightToLeft
                        );
                          })

                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

}
