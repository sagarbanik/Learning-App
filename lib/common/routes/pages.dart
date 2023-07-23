import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/application/application_page.dart';
import 'package:ulearning/pages/application/bloc/app_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning/pages/home/home_page.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:ulearning/pages/profile/settings/settings_page.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/register/register.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning/pages/sign_in/sign_in.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning/pages/welcome/welcome.dart';

class AppPages{

  ///Route List
  static List<PageEntity> routes(){
    return  [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBlock())
      ),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())
      ),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_) => RegisterBloc())
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc())
      ),
      PageEntity(
          route: AppRoutes.HOMEPAGE,
          page: const HomePage(),
          bloc: BlocProvider(create: (_) => HomePageBloc())
      ),
      PageEntity(
          route: AppRoutes.SETTINGS,
          page: const SettingsPage(),
          bloc: BlocProvider(create: (_) => SettingsBloc())
      ),
    ];
  }

  ///Returns all the bloc provider
  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders = <dynamic>[];

    for(var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  ///A model that coves entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if(settings.name != null){
      //Check for route name matching when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
      if(result.isNotEmpty){
        print("Valid route name: ${settings.name}");
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route == AppRoutes.INITIAL && deviceFirstOpen){
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          print("isLoggedIn : $isLoggedIn");
          if(isLoggedIn){
            return MaterialPageRoute(builder: (_) => const ApplicationPage(),settings: settings);
          }
          return MaterialPageRoute(builder: (_) => const SignIn(),settings: settings);
        }
        return MaterialPageRoute(builder: (_) => result.first.page,settings: settings);
      }
    }
    print("Invalid route name: ${settings.name}");
    return MaterialPageRoute(builder: (_)=> const SignIn(),settings: settings);
  }
}

///Class for generating routes
class PageEntity{
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});

}