import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/main.dart';
import 'package:ulearning/pages/welcome/bloc/welcom_events.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBlock,WelcomeState>(
          builder: (context,state){
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: controller,
                    onPageChanged: (index){
                      state.page = index;
                      BlocProvider.of<WelcomeBlock>(context).add(WelcomeEvent());
                      //print(index);
                    },
                    children: [
                      page(
                          1,
                          context,
                          "Next",
                          "First See Learning",
                          "Forgot about a for of paper all knowledge in one learning!",
                          "assets/images/reading.png"
                      ),
                      page(
                          2,
                          context,
                          "Next",
                          "Connect With Everyone",
                          "Always keep in touch with your tutor and friend. Let's get connected!",
                          "assets/images/boy.png"
                      ),
                      page(
                          3,
                          context,
                          "Get Started",
                          "Always Fascinated Learning",
                          "Anywhere, anytime. The time is at your discretion so study whenever you want!",
                          "assets/images/man.png"
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 90.h,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: state.page,
                      decorator: DotsDecorator(
                          color: AppColors.primaryThirdElementText,
                          size: const Size.square(8.0),
                          activeColor: AppColors.primaryElement,
                          activeSize: const Size(15.0,8.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }

  Widget page(int index, BuildContext context, String btnName, String title, String subTitle, String imagePath){
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: 30.w,
              right: 30.w
          ),
          width: 375.w,
          child: Text(
            subTitle,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            //print(index);
            if(index<3){
              //animation
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate
              );
            }else{
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
              Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context).pushNamedAndRemoveUntil("/sign-in", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 100.h,
              left: 25.w,
              right: 25.w
            ),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1)
                  ),
              ]
            ),
            child: Center(
              child: Text(
                btnName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
