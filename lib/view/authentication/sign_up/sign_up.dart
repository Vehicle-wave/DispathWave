import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/res/assets/app_icon.dart';
import 'package:wave_dispatch/res/assets/app_images.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view/authentication/login/login.dart';
import 'package:wave_dispatch/view/authentication/sign_up/components/input_field.dart';
import 'package:wave_dispatch/view_model/controller/sign_up_controller.dart';

import 'components/auth_btn.dart';
import 'components/social_btn.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});
   final controller=Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'SignUp',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Obx(() => GestureDetector(
                    onTap: () => controller.picImage(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.1),
                      radius: 50,
                      backgroundImage: controller.image.isEmpty ?null :FileImage(File(controller.image.value)),
                      child: controller.image.isEmpty? Center(child: Icon(Icons.camera_alt_outlined,
                        color: Colors.grey.withOpacity(.5),)): null,
                    ),
                  )),
                ),
                SizedBox(height: 20,),
                InputField(icon: AppIcon.profile, hint: 'Full Name', controller: controller.fullName),
                SizedBox(
                  height: 20,
                ),
                InputField(icon: AppIcon.email, hint: 'abc@gmail.com', controller: controller.email),
                SizedBox(
                  height: 20,
                ),
                Obx(() => InputField(icon: AppIcon.password, hint: 'Password', controller: controller.password,
                  obscure: controller.obscurePassword.value,
                  suffix: GestureDetector(
                      onTap: () => controller.obscurePassword.toggle(),

                      child: Icon(Icons.remove_red_eye_outlined,color: Colors.grey.withOpacity(.5),size: 20,)),
                ),),
                SizedBox(
                  height: 20,
                ),
                Obx(() => InputField(icon: AppIcon.password, hint: 'Confirm Password', controller: controller.confirmPassword,
                  obscure: controller.obscurePassword.value,
                  suffix: GestureDetector(
                      onTap: () => controller.obscurePassword.toggle(),

                      child: Icon(Icons.remove_red_eye_outlined,color: Colors.grey.withOpacity(.5),size: 20,)),
                ),),
                SizedBox(
                  height: 30,
                ),
                Center(child:Obx(() =>  AuthenticationButton(text: 'SignUp',
                  onTap: () => controller.signUp(),loading: controller.loading.value,))),
                SizedBox(height: 10,),
                Center(child: Text('OR',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.grey,
                  fontSize: 15
                ),),),
                SocialLoginButtons(),
                SizedBox(height: 20,),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),)),
                    child: Text.rich(TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.grey,
                          fontSize: 13
                        )
                        ),
                        TextSpan(
                            text: 'Sign in',style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.blue,
                            fontSize: 13
                        )
                        )
                      ]

                    )),
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}








class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [SizedBox(height: 20,),
          SocialBtn(text: 'Login with Google',icon: AppIcon.google,),
          SizedBox(height: 20,),
          SocialBtn(text: 'Login with Facebook',icon: AppIcon.facebook,),],
      ),
    );
  }
}
