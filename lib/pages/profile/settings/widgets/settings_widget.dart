import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';

AppBar buildSettingsAppbar(){
  return AppBar(
    title: Container(
      child: Container(
        child: Text(
          "Settings",
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ),
    ),
  );
}