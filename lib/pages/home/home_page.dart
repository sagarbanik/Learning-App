import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';
import 'package:ulearning/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBloc,HomePageStates>(
        builder: (context,state){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0,horizontal: 20.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText('Hello,',color: AppColors.primaryThirdElementText),
                ),
                SliverToBoxAdapter(
                  child: homePageText('John Doe,',top: 2),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                ),
                SliverToBoxAdapter(
                  child: searchView(),
                ),
                SliverToBoxAdapter(
                  child: sliderView(context,state),
                ),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h,
                    horizontal: 0.w,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context,int index){
                          return GestureDetector(
                            onTap: (){},
                            child: courseGrid(),
                          );
                      },
                      childCount: 4
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
