import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/widgets/flutter_toast.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';

class RegisterController{
  final BuildContext context;
  const RegisterController({required this.context});


  void handleRegistrationWithEmail() async{
    final state = context.read<RegisterBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if(userName.isEmpty){
      toastInfo(msg: "Username required!");
      return;
    }

    if(email.isEmpty){
      toastInfo(msg: "Email required!");
      return;
    }

    if(password.isEmpty){
      toastInfo(msg: "Password required!");
      return;
    }

    if(rePassword.isEmpty){
      toastInfo(msg: "Re-enter password required!");
      return;
    }

    try{

      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
      );

      if(credential.user != null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "A verification email is sent.Please verify your email");
        Navigator.of(context).pop();
      }

    }on FirebaseException catch(e){
      if(e.code == 'weak-password'){
        toastInfo(msg: "The password provided is too weak");
      }else if(e.code == 'email-already-in-use'){
        toastInfo(msg: "The email already taken");
      }else if(e.code == 'invalid-email'){
        toastInfo(msg: "The email is invalid");
      }else{
        toastInfo(msg: e.toString());
      }
    }

  }

}