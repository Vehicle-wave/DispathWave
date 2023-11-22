import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/data/network/firebase_services/authication.dart';

import '../../utils/utils.dart';

class SignInController extends GetxController{
  final email=TextEditingController();
  final password=TextEditingController();
  RxBool loading=false.obs;
  RxBool obscurePassword=false.obs;
  RxBool remember=true.obs;



  signIn(){
    if(!EmailValidator.validate(email.value.text.toString())){
      Utils.showSnackBar('Warning', 'Invalid Email', const Icon(Icons.warning_amber));
      return;
    }
    if(password.value.text.toString().isEmpty){
      Utils.showSnackBar('Warning', 'Please enter valid password', const Icon(Icons.warning_amber));
      return;
    }

    FirebaseAuthentication.loginAccount();

  }


  onFaceBookClick(){

  }
  onGoogleClick(){

  }

}