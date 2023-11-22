import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view/loads/assigned/assigned_load.dart';
import 'package:wave_dispatch/view/loads/canceled/canceled.dart';
import 'package:wave_dispatch/view_model/controller/load_controller.dart';

class Loads extends StatelessWidget {
   Loads({super.key});
   final controller =Get.put(LoadController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => controller.changeTab(0),
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: Obx(() => Text('Assigned',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: controller.selectedTab.value==0? primaryColor:Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),),
                    )
                  ),
                  GestureDetector(
                    onTap: () => controller.changeTab(1),
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: Obx(() => Text('Cancled',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: controller.selectedTab.value==1? primaryColor:Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),),
                    )
                  )
                ],
              ),
            ),
            Expanded(
                child: PageView(
                  controller: controller.pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                AssignedLoad(),
                CancleLoads()
              ],
            ))
          ],
        ),
      ),
    );
  }
}
