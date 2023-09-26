import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/bottom_tabs/dashboard/view/dashboard_view.dart';
import 'package:jobfind/app/bottom_tabs/my_jobs/my_jobs.dart';
import 'package:jobfind/app/bottom_tabs/profile/profile_view.dart';
import 'package:jobfind/app/bottom_tabs/save_jobs/save_jobs.dart';
import 'package:jobfind/app/home/controller/home_controller.dart';
import 'package:jobfind/util/theme.dart';

class UserHome extends StatefulWidget {
  int currentIndex;

  UserHome({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final homeController = Get.put(HomeController());

  final List _screens = [
    DashboardView(),
    MyJobs(),
    SaveJobs(),
    ProfileView(),
  ];

  void _selectedPage(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return WillPopScope(
      onWillPop: () async {
        if (widget.currentIndex == 0) {
          return true;
        }
        setState(() {
          widget.currentIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedLabelStyle:
              TextStyle(fontFamily: AppFont.medium, fontSize: AppSizes.size_12),
          unselectedLabelStyle: TextStyle(
              color: AppColor.blackColor,
              fontFamily: AppFont.medium,
              fontSize: AppSizes.size_12),
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: AppColor.blackColor,
          onTap: _selectedPage,
          currentIndex: widget.currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    color: widget.currentIndex == 0
                        ? AppColor.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 7, top: 7, bottom: 7, right: 7),
                  child: ImageIcon(
                    AssetImage(
                      "assets/images/home1.png",
                    ),
                    size: Get.height * 0.025,
                    color:
                        widget.currentIndex == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              label: "Home",
              tooltip: "Home",
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    color: widget.currentIndex == 1
                        ? AppColor.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 7, top: 7, bottom: 7, right: 7),
                  child: ImageIcon(
                    AssetImage(
                      "assets/images/my.png",
                    ),
                    size: Get.height * 0.026,
                    color:
                    widget.currentIndex == 1 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              label: "Home",
              tooltip: "Home",
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    color: widget.currentIndex == 2
                        ? AppColor.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 7, top: 7, bottom: 7, right: 7),
                  child: ImageIcon(
                    AssetImage(
                      "assets/images/book1.png",
                    ),
                    size: Get.height * 0.024,
                    color:
                    widget.currentIndex == 2 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              label: "Home",
              tooltip: "Home",
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    color: widget.currentIndex == 3
                        ? AppColor.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 7, top: 7, bottom: 7, right: 7),
                  child: ImageIcon(
                    AssetImage(
                      "assets/images/profile.png",
                    ),
                    size: Get.height * 0.025,
                    color:
                        widget.currentIndex == 3 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              label: "",
            ),

          ],
        ),
        body: _screens[widget.currentIndex],
      ),
    );
  }
}
