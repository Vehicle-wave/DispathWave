import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/res/assets/app_images.dart';
import 'package:wave_dispatch/view/authentication/sign_up/sign_up.dart';
import 'package:wave_dispatch/view_model/controller/sign_in_controller.dart';

import '../../../res/assets/app_icon.dart';
import '../sign_up/components/auth_btn.dart';
import '../sign_up/components/input_field.dart';

class Login extends StatelessWidget {
   Login({super.key});
  final controller=Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
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
                'SignIn',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Center(child: Image.asset(AppImages.logo)),
              SizedBox(height: 10,),


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
              SizedBox(height: 5,),
              Row(
                children: [
                  Obx(() =>  Switch(
                    inactiveTrackColor: Colors.grey.withOpacity(.4),
                    trackOutlineColor: MaterialStatePropertyAll(
                      Colors.transparent,
                    ),
                    activeTrackColor: Colors.blue,
                    value: controller.remember.value, onChanged: (value) {
                    controller.remember.value=value;
                  },)),
                  SizedBox(width: 10,),
                  Text('Remember Me',style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12
                  ),),
                  Spacer(),
                  Text('Forgot Password?',style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.blue,
                    fontSize: 12
                  ),)
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(child:Obx(() =>  AuthenticationButton(text: 'SignIn',
                onTap: () => controller.signIn(),loading: controller.loading.value,))),
              SizedBox(
                height: 20,
              ),
              SocialLoginButtons(),
              SizedBox(height: 20,),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp(),)),
                  child: Text.rich(TextSpan(
                      children: [
                        TextSpan(
                            text: 'Don\'t have an account? ',style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.grey,
                            fontSize: 13
                        )
                        ),
                        TextSpan(
                            text: 'Sign up',style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.blue,
                            fontSize: 13
                        )
                        )
                      ]

                  )),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
