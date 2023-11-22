import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view_model/controller/load_controller.dart';
import 'package:wave_dispatch/view_model/controller/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
class Profile extends StatelessWidget {
   Profile({super.key});
   final controller=Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.userData.isNotEmpty?Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.withOpacity(.1),
              child: Center(
                child: CachedNetworkImage(imageUrl: controller.userData['profilePicture'],
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 50,
                    backgroundImage: imageProvider,
                  ),
                  placeholder: (context, url) {
                    return Center(
                      child: SizedBox(height: 20,width: 20,child: SpinKit(color: primaryColor,)),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(controller.userData['fullName'].toString(),style: TextStyle(
            color: Colors.black,fontWeight: FontWeight.bold
          ),),
          ProfileButton(text: 'Edit Profile',icon: Icons.person,),
          ProfileButton(text: 'Notification',icon: Icons.notification_add_outlined,),
          ProfileButton(text: 'Payment',icon: Icons.card_travel,),
          ProfileButton(text: 'Security',icon: Icons.security,),
        ],
      ) : Center(child: SizedBox(height: 20,width: 20,child: SpinKit(color: primaryColor),),))
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      width: MediaQuery.sizeOf(context).width/1.5,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.3),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Icon(icon,size: 15,color: Colors.black,),
          SizedBox(width: 10,),
          Text(text,style: TextStyle(
            color: Colors.black,
          ),),
          Spacer(),
          Icon(Icons.arrow_forward_ios,color: Colors.black,size: 14,)
        ],
      ),
    );
  }
}
