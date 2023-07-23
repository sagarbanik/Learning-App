import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/routes.dart';
import 'package:ulearning/common/values/colors.dart';


import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      //providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context,child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ulearning App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.primaryText
              ),
              elevation: 0,
              backgroundColor: Colors.white
            ),
          ),
          onGenerateRoute: AppPages.GenerateRouteSettings,
        ),
      ),
    );
  }
}


