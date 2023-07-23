import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_states.dart';
import 'package:ulearning/pages/profile/settings/widgets/settings_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                  GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: const Text(
                              "Confirm Logout"
                            ),
                            content: const Text(
                                "Confirm Logout"
                            ),
                            actions: [
                              TextButton(
                                onPressed: ()=> Navigator.of(context).pop(),
                                child: const Text(
                                  "Cancel"
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
                                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
                                },
                                child: const Text(
                                    "Confirm"
                                ),
                              ),
                            ],
                          );
                        }
                      );
                    },
                    child: Container(
                      height: 100.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                            "assets/icons/Logout.png"
                          ),
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
}
