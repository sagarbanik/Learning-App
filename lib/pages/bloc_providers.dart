
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';

import 'application/bloc/app_bloc.dart';

class AppBlocProviders{

  static get allBlocProviders => [
    BlocProvider(
      // lazy: false,
      create: (context) => WelcomeBlock(),
    ),
    /*BlocProvider(
      create: (context) => AppBlocs(),
    ),*/
    BlocProvider(
      create: (context) => SignInBloc(),
    ),
    BlocProvider(
      create: (context) => RegisterBloc(),
    ),
  ];

}