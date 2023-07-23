import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/common/widgets/flutter_toast.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController{
  final BuildContext context;
  const SignInController({ required this.context});

  void handleSignIn(String type) async{
    try{
      if(type == "email"){
        final state = context.read<SignInBloc>().state;
        String emailInput = state.email;
        String passwordInput = state.password;

        if(emailInput.isEmpty){
          toastInfo(msg: "Email required!");
          return;
        }

        if(passwordInput.isEmpty){
          toastInfo(msg: "Password required!");
          return;
        }

        try{
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailInput,
              password: passwordInput
          );

          if(credential.user == null){
            toastInfo(msg: "User does not exist!");
            return;
          }

          if(!credential.user!.emailVerified){
            toastInfo(msg: "You need to verify your email!");
            return;
          }

          var user = credential.user;
          if(user != null){
            print("User exist!");
            Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
          }else{
            //We have error while getting user from firebase
            toastInfo(msg: "Currently you are not user of this app.");
            return;
          }

        }on FirebaseAuthException catch(e){
          if(e.code == 'user-not-found'){
            toastInfo(msg: 'No user found with this email');
          }else if(e.code == 'wrong-password'){
            toastInfo(msg: 'Wrong password provided for this user');
          }else if(e.code == 'invalid-email'){
            toastInfo(msg: 'Email format is wrong');
          }
        }

      }
    }catch(e){
      print(e.toString());
    }
  }

}