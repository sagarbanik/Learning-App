import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/application/bloc/app_bloc.dart';
import 'package:ulearning/pages/application/bloc/app_event.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_states.dart';
import 'package:ulearning/pages/profile/settings/widgets/settings_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void removeUserData(){
    ///Set index 0 for Homepage
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildSettingsAppbar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc,SettingsStates>(
          builder: (context,state){
            return Container(
              child: Column(
                children: [
                  settingsButton(context,removeUserData),
                ],
              ),
            );
          },
        )
      ),
    );
  }
}
