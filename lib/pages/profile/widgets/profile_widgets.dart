import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/colors.dart';

AppBar buildProfileAppBar(){
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset(
              "assets/icons/menu.png"
            ),
          ),
          Text(
            "Profile",
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp
            ),
          ),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset(
                "assets/icons/more-vertical.png"
            ),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton(){
  return Container(
    width: 80.w,
    height: 80.h,
    padding: EdgeInsets.only(right: 6.w),
    alignment: Alignment.bottomRight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.h),
      image: const DecorationImage(
        image: AssetImage(
            "assets/icons/headpic.png"
        ),
      ),
    ),
    child: Image.asset(
      "assets/icons/edit_3.png",
      width: 25.w,
      height: 25.h,
    ),
  );
}

var imagesInfo = <String,String>{
  "Settings" : "settings.png",
  "Payment Details" : "credit-card.png",
  "Achievement" : "award.png",
  "Love" : "heart(1).png",
  "Learning Remainder" : "cube.png"
};
Widget buildListView(BuildContext context){
  return Column(
    children: [
      ...List.generate(imagesInfo.length, (index) {
        return GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColors.primaryElement
                  ),
                  child: Image.asset("assets/icons/${imagesInfo.values.elementAt(index)}"),
                ),
                SizedBox(width: 15.w),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ],
  );
}