import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/data/user_pref/user_pref.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view/authentication/login/login.dart';
import 'package:wave_dispatch/view_model/controller/profile_controller.dart';

class CustomDrawer extends StatelessWidget {
   CustomDrawer({super.key});
   final controller=Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width/1.5,
      child: Column(
        children: [
          SizedBox(height: 30,),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.withOpacity(.1),
            child: CachedNetworkImage(imageUrl: controller.userData['profilePicture'],
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 40,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: SpinKit(color: primaryColor),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(controller.userData['fullName'].toString(),style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),),
          Container(height: 2,width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10),
          color: Colors.grey.withOpacity(.1),
          ),
          DrawerButton(text: 'Profile',),
          DrawerButton(text: 'Message',),
          DrawerButton(text: 'Contact',),
          DrawerButton(text: 'About us',),
          DrawerButton(text: 'Setting',),
          DrawerButton(text: 'Help',),
          DrawerButton(text: 'Sign out',onTap: () {
            UserPref.clearUser();
            Get.offAll(()=>Login());
          },),
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({super.key, required this.text, this.onTap});
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: MediaQuery.sizeOf(context).width/2.4,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),
        ),
      ),
    );
  }
}
