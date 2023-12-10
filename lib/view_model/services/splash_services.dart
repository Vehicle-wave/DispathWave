import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave_dispatch/admin/home/home.dart';
import 'package:wave_dispatch/view/authentication/sign_up/sign_up.dart';
import 'package:wave_dispatch/view/home/home_page.dart';

class SplashServices {
  static checkLogin(BuildContext context) async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 2), () {
    if(preferences.getString('uid')==null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp(),));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView(),));
    }
    });
  }
}