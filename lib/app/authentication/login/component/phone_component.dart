import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jobfind/util/theme.dart';
import 'package:jobfind/widgets/app_text.dart';
import 'package:jobfind/widgets/app_textfield.dart';
import 'package:jobfind/widgets/drop_down.dart';



class CountryCodeWid extends StatefulWidget {
  final TextEditingController phoneController;

  final Function(dynamic code) onPickCode;
  Widget?child;
  final Color?color;
  final FontWeight?color1;

   CountryCodeWid({
    required this.phoneController,
     this.child,
     this.color,
     this.color1,
    required this.onPickCode,
  });

  @override
  _CountryCodeWidState createState() => _CountryCodeWidState();
}

class _CountryCodeWidState extends State<CountryCodeWid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.06,
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.borderColorField,width: 1.5  ),

          color:
          widget.color??
              AppColor.borderColorField ,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.015),
        child: Row(
          children: [
            widget.child??
            Icon(Icons.phone_android,color: Colors.black,
            size: Get.height*0.028,
            ),
            widget.child??
            SizedBox(width: Get.width*0.015,),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/flag.png",
                height: Get.height*0.037,

                  ),
            ),
            SizedBox(width: Get.width*0.015,),
            AppText(title: "+91",
            color: Colors.black,
              size: AppSizes.size_14,
              fontWeight: FontWeight.w500,
              fontFamily: AppFont.regular,
            ),
            SizedBox(width: Get.width*0.007,),
            Icon(Icons.keyboard_arrow_down_rounded,color: Colors.grey.withOpacity(0.7),
              size: Get.height*0.02,
            ),
            SizedBox(width: Get.width*0.02,),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide.none, bottom: BorderSide.none),
                  ),
                  child: TextField(
                    cursorColor: AppColor.primaryColor,

                    controller: widget.phoneController,

                    style: TextStyle(
                      fontSize: AppSizes.size_14,
                      color: AppColor.blackColor,
                      fontWeight:
                      widget.color1??
                      FontWeight.w500,
                      fontFamily: AppFont.regular,),
                    decoration: InputDecoration(
                      hintText: 'Phone Number',

                      hintStyle: TextStyle(
                        color: AppColor.blackColor.withOpacity(0.7),
                        fontSize: AppSizes.size_13,

                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget termsAndCondition({onTap,color,color1,color2}){
  return  Row(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: Get.height*0.022,
          width: Get.height*0.022,
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: color1),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Center(child: Icon(Icons.check,color: color2,
            size: Get.height*0.018,
          )),
        ),
      ),
      SizedBox(width: Get.width*0.022,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                  title:
                  "I Agree to the",

                  color: AppColor.blackColor.withOpacity(0.7),
                  fontFamily: AppFont.semi,
                  size: AppSizes.size_12),
              Text(" Terms Of Service",style: TextStyle(color: AppColor.primaryColor,fontFamily: AppFont.semi,
                  fontSize: AppSizes.size_12),),
              AppText(
                  title:
                  " and ",

                  color: AppColor.blackColor.withOpacity(0.7),
                  fontFamily: AppFont.semi,
                  size: AppSizes.size_12),
              Text(" Privacy ",style: TextStyle(color: AppColor.primaryColor,fontFamily: AppFont.semi,fontSize: AppSizes.size_12),),

            ],
          ),
          Text("Policy",style: TextStyle(color: AppColor.primaryColor,fontFamily: AppFont.semi,fontSize: AppSizes.size_12),),
        ],
      ),


    ],
  );
}



Widget jobField({String? Function(String?)? validator,TextEditingController?controller,
  String?hint="", TextInputType?textInputType,TextInputAction?textInputAction,
  bool obscure = false,
  bool isSuffix= true,
  bool isPref= false,
  bool isRead=false,
  bool isCur=true,
  int?max,
  Widget?child,
  Widget?child1,
  Color?color,
  final VoidCallback? onTap,
  Function(String?)? onChange


}){
  return AppTextFied(
    isborderline: true,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    isborderline2: true,
    validator: validator,
    obsecure: obscure,

    onTap: onTap,
    isFill: true,
    onChange: onChange,
    isPrefix: isPref,
    isReadOnly: isRead,
    isShowCursor: isCur,
    suffixIcon: child??SizedBox.shrink(),
    prefixIcon: child1??SizedBox.shrink(),
    padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.03,
        vertical: Get.height * 0.016),
    borderRadius: BorderRadius.circular(10),
    borderRadius2: BorderRadius.circular(10),
    borderColor:color?? AppColor.borderColorField,
    hint: hint??"",
    hintColor: Colors.black.withOpacity(0.6),
    fillColor:color?? Colors.white,
    textInputType:
    textInputType??
        TextInputType.emailAddress,
    textInputAction:
    textInputAction??
        TextInputAction.next,
    hintSize: AppSizes.size_12,
    isSuffix: isSuffix,
    controller: controller,
    fontFamily: AppFont.regular,
    borderColor2:color?? AppColor.primaryColor,
    maxLines: max??1,
  );
}
Widget textAuth({text,Color?color,double?height}){
  return Row(
    children: [
      AppText(
        title: "$text",
        size:height?? AppSizes.size_13,
        fontWeight: FontWeight.w500,
        fontFamily: AppFont.medium,
        color: AppColor.blackDarkColor,
      ),
      AppText(
        title: " *",
        size: AppSizes.size_14,
        fontWeight: FontWeight.w400,
        fontFamily: AppFont.regular,
        color: color??
            AppColor.boldBlackColor.withOpacity(0.8),
      ),
    ],
  );
}

Widget dropDownAppAdd({hint,onChange,items,value,width,Color?color,double ? height}){
  return SortedByDropDown(
      hint: hint,
      icon: SvgPicture.asset("assets/icons/downs.svg",height: Get.height*0.03,),
      buttonDecoration: BoxDecoration(
        color: AppColor.white,
        border: Border.all(
            color:
            color??
                AppColor.borderColorField, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      fontSize: AppSizes.size_14,
      fontFamily: AppFont.regular,
      hintColor:Colors.black.withOpacity(0.6),
      fontFamily1: AppFont.regular,
      fontSize1: AppSizes.size_12,
      dropdownItems: items,
      value: value,
      buttonHeight: Get.height * 0.055,
      dropdownHeight:height?? Get.height,
      dropdownWidth: width,
      buttonElevation: 0,
      onChanged: onChange
  );
}