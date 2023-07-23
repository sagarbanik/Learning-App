import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/application/bloc/app_bloc.dart';
import 'package:ulearning/pages/application/bloc/app_event.dart';
import 'package:ulearning/pages/application/bloc/app_state.dart';

import 'widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc,AppState>(
      builder: (context,state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 56.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.h),
                      topRight: Radius.circular(20.h),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                      ),
                    ]
                ),
                child: BottomNavigationBar(
                  onTap: (index){
                    context.read<AppBloc>().add(TriggerAppEvent(index));
                  },
                  currentIndex: state.index,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourthElementText,
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      });
  }
}
