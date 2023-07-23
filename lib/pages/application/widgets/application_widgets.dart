import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/home/home_page.dart';
import 'package:ulearning/pages/profile/profile_page.dart';

import '../../../common/values/colors.dart';

Widget buildPage(int index){
  List<Widget> widget = [
    const HomePage(),
    Center(child: Text("Search"),),
    Center(child: Text("Course"),),
    Center(child: Text("Chat"),),
    const ProfilePage()
  ];

  return widget[index];

}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "Home",
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/home.png",
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/search2.png",
        color: AppColors.primaryElement,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/search2.png",
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Course",
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/play-circle1.png",
      ),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Chat",
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/message-circle.png",
      ),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Profile",
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/person2.png",
      ),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
];

