import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_page_events.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w,right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset(
              "assets/icons/menu.png"
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/person.png",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text,{Color color=AppColors.primaryText,int top=20,int fontSize=24}){
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
          color:color,
          fontSize: fontSize.sp,
          fontWeight: FontWeight.bold
      ),
    ),
  );
}

Widget searchView(){
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.w,
        decoration: BoxDecoration(
          color:AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(
            color: AppColors.primaryFourthElementText,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w),
              width: 16.w,
              height: 16.h,
              child: Image.asset("assets/icons/search.png"),
            ),

            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                autocorrect: false,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                  hintText: "search your desired course",
                  helperStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
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
      ),
      SizedBox(width: 10.w),
      GestureDetector(
        onTap: (){},
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset(
            "assets/icons/options.png",
          ),
        ),
      ),
    ],
  );
}

Widget sliderView(BuildContext context,HomePageStates state){
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value){
            context.read<HomePageBloc>().add(HomePageDots(value));
          },
          children: [
            _sliderContainer(path: "assets/icons/art.png"),
            _sliderContainer(path: "assets/icons/image1.png"),
            _sliderContainer(path: "assets/icons/image4.png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0,5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _sliderContainer({String path="assets/icons/art.png"}){
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.h),
      ),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          path,
        ),
      ),
    ),
  );
}

Widget menuView(){
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reUsableText("Choose your course"),
            GestureDetector(
              onTap: (){},
              child: _reUsableText("See all",color: AppColors.primaryThirdElementText,fontSize: 10),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular",color: AppColors.primaryThirdElementText,bgColor:Colors.white),
            _reusableMenuText("Latest",color: AppColors.primaryThirdElementText,bgColor:Colors.white),
          ],
        ),
      ),
    ],
  );
}

Widget _reUsableText(String text,{Color color=AppColors.primaryText,int fontSize=16,FontWeight weight=FontWeight.bold}){
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: fontSize.sp,
    ),
  );
}

Widget _reusableMenuText(String text,{Color color=AppColors.primaryElementText,Color bgColor=AppColors.primaryElement}){
  return Container(
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15.w),
    ),
    padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        top: 5.h,
        bottom: 5.h
    ),
    margin: EdgeInsets.only(right: 20.w),
    child: _reUsableText(
      text,
      color: color,
      weight: FontWeight.normal,
      fontSize: 11,
    ),
  );
}

Widget courseGrid(){
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
            "assets/icons/image2.png"
        ),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best course for IT",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "30 lessons",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryFourthElementText,
              fontWeight: FontWeight.bold,
              fontSize: 8.sp
          ),
        ),
      ],
    ),
  );
}