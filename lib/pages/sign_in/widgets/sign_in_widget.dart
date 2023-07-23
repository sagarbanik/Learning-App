import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar(){
  return AppBar(
    centerTitle: true,
    title: Text(
      "Log In",
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Container(
        //color: Colors.grey.withOpacity(0.3),
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context){
  return Container(
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSocialIcon("google"),
        SizedBox(width: 15.w,),
        buildSocialIcon("apple"),
        SizedBox(width: 15.w,),
        buildSocialIcon("facebook"),
      ],
    ),
  );
}

Widget buildSocialIcon(String iconName ){
  return GestureDetector(
    onTap: (){},
    child: Container(
      width: 40.w,
      height: 40.w,
      child: Image.asset(
        "assets/icons/$iconName.png",
      ),
    ),
  );
}

Widget reusableText(String text){
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp
      ),
    ),
  );
}

Widget buildTextField(String hintText,String textType,String iconName,
      void Function(String value)? func
    ){
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(
      bottom: 20.h,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(
        color: AppColors.primaryFourthElementText,
      ),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 16.w,
          ),
          child: Image.asset(
            width: 16.w,
            height: 16.h,
            "assets/icons/$iconName.png"
          ),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
            decoration: InputDecoration(
              hintText: hintText,
              helperStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
                fontFamily: "Avenir"
            ),
          ),
        ),
      ],
    ),
  );
}

Widget forgetPassword(){
  return Container(
    width: 260.w,
    height: 44.h,
    margin: EdgeInsets.only(left: 25.w),
    child: GestureDetector(
      onTap: (){

      },
      child: Text(
        "Forgot Password",
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 14.sp
        ),
      ),
    ),
  );
}

Widget buildButton(String name,String type, void Function()? func){
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(top: type=="login" ? 40.h : 20.h,left: 25.w,right: 25.w),
      decoration: BoxDecoration(
        color: type == "login" ? AppColors.primaryElement : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          color: type == "login" ? Colors.transparent : AppColors.primaryElementText,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
            color: Colors.grey.withOpacity(0.5)
          ),
        ]
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: type == "login" ? AppColors.primaryBackground : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}