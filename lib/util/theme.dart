import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColor {
  static const primaryColor =Color(0xFF15015e);
  static const color2 =Color(0xFFd8ccfe);
  static const ORANGE =Color(0xFFfa9e4a);
  static const blackDarkColor = Color(0xff242424);
  static const color1 =Color(0xFFb1edff);
  static const color3 =Color(0xFFffd5b0);
  static const boldBlackColor = Color(0xFF212121);
  static const grey =Color(0xFFf2f2f2);
  static const purple =Color(0xFF7c4dfb);
  static const grey1 =Color(0xFFefefef);
  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static const greyLightColor = Color(0xff909090);
  static Color get white => Colors.white;
  static const blackColor = Color(0xFF000000);
  static const borderColorField = Color(0xFFE8E6EA);
  static const greyColor = Colors.grey;
  static const backgroundColor = Color.fromARGB(255, 243, 243, 243);
  static const transParent = Colors.transparent;



}

class AppSizes {
  static double size_10 = Get.height / 81.2;
  static double size_11 = Get.height / 73.8;
  static double size_12 = Get.height / 67.7;
  static double size_13 = Get.height / 62.5;
  static double size_14 = Get.height / 58;
  static double size_15 = Get.height / 54.1;
  static double size_16 = Get.height / 50.8;
  static double size_17 = Get.height / 47.8;
  static double size_18 = Get.height / 45.1;
  static double size_19 = Get.height / 42.7;
  static double size_20 = Get.height / 40.6;
  static double size_21 = Get.height / 38.7;
  static double size_22 = Get.height / 36.9;
  static double size_23 = Get.height / 35.3;
  static double size_24 = Get.height / 33.8;
  static double size_25 = Get.height / 32.5;
  static double size_26 = Get.height / 31.2;
  static double size_27 = Get.height / 30.1;
  static double size_28 = Get.height / 29;
  static double size_29 = Get.height / 28;
  static double size_30 = Get.height / 27.1;
}






void showLoadingIndicator({required BuildContext context}) {
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          height: 65,width: 65,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),     color: Colors.white,),
          child: Container(

            height: 25,width: 25,color: Colors.transparent,child:  const Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.black26,
              valueColor: AlwaysStoppedAnimation<Color>(
                  AppColor.primaryColor //<-- SEE HERE

              ),
                // strokeWidth: 5,
          ),
            ),),
        ),
      );
    },
  );
}
class AppFont {
  static String regular = "regular";
  static String medium = "medium";
  static String bold = "bold";
  static String semi = "semi";
  static String light = "light";

}