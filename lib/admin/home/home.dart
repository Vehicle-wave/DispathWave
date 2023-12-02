import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/admin/cancelations/cancellations.dart';
import 'package:wave_dispatch/admin/drivers/drivers.dart';
import 'package:wave_dispatch/admin/orders/orders.dart';
import 'package:wave_dispatch/admin/payments/payments.dart';
import 'package:wave_dispatch/admin/requests/requests.dart';
import 'package:wave_dispatch/admin/user/users.dart';
import 'package:wave_dispatch/res/assets/app_images.dart';
import 'package:wave_dispatch/view/drawer/drawer.dart';
import 'components/admin_home_button.dart';
import 'components/admin_top_header.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AdminTopHeader(),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdminOptionButton(onTap: () =>Get.to( Users()),text: 'Customers',icon: AppImages.logo,),
                    AdminOptionButton(onTap: ()=>Get.to( Drivers()),text: 'Drivers',icon: AppImages.logo,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdminOptionButton(onTap: () => Get.to(RequestsManage()),text: 'Requests',icon: AppImages.logo,),
                    AdminOptionButton(onTap: () => Get.to(Orders()),text: 'Orders',icon: AppImages.logo,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdminOptionButton(onTap: () => Get.to(Cancellations()),text: 'Cancellations',icon: AppImages.logo,),
                    AdminOptionButton(onTap: () => Get.to(Payments()),text: 'Payments',icon: AppImages.logo,),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}




