import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wave_dispatch/data/network/firebase_services/authication.dart';
import 'package:wave_dispatch/utils/utils.dart';
class SignUpController extends GetxController{
  final fullName=TextEditingController();
  final email=TextEditingController();
  final password=TextEditingController();
  final confirmPassword=TextEditingController();

  RxString image=''.obs;
  RxBool loading=false.obs;
  RxBool obscurePassword=false.obs;



  signUp(){


    if(fullName.value.text.toString().isEmpty){
      Utils.showSnackBar('Warning', 'Please enter valid name', const Icon(Icons.warning_amber));
      return;
    }
    if(!EmailValidator.validate(email.value.text.toString())){
      Utils.showSnackBar('Warning', 'Invalid Email', const Icon(Icons.warning_amber));
      return;
    }
    if(password.value.text.toString().length<6){
      Utils.showSnackBar('Warning', 'Password length should be greater than 6', const Icon(Icons.warning_amber));
      return;
    }
    if(password.value.text.toString()!=confirmPassword.value.text.toString()){
      Utils.showSnackBar('Warning', 'Password does\'nt match', const Icon(Icons.warning_amber));
      return;
    }
    if(image.value.isEmpty){
      Utils.showSnackBar('Warning', 'Please set your profile picture', const Icon(Icons.warning_amber));
      return;
    }

    FirebaseAuthentication.createAccount();

  }


  picImage() async {
    final picker=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(picker!=null){
      image.value=picker.path;
    }else{
      image.value='';
    }
  }
}