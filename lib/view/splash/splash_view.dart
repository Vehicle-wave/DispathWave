import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/res/assets/app_images.dart';
import 'package:wave_dispatch/view_model/services/splash_services.dart';

import '../../view_model/controller/load_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}



class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    SplashServices.checkLogin(context);
    final controller = Get.put(LoadController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(AppImages.logo,))
        ],
      ),
    );
  }
}
