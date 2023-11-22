import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/data/network/firebase_services/load_servics.dart';
import 'package:wave_dispatch/view/load_details/components/load_card_btn.dart';
import 'package:wave_dispatch/view/loads/assigned/components/status_button.dart';
import '../../../../res/constants.dart';
class UpdateStatusCard extends StatelessWidget {
   UpdateStatusCard({super.key, required this.snapshot});
   final DataSnapshot snapshot;
   final controller=Get.put(StatusCardController());
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        height: 470,
        width: MediaQuery.sizeOf(Get.context!).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Update Status',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,
              fontSize: 15
            ),),
            const SizedBox(height: 10,),
            Center(
              child: Text(snapshot.child('status').value.toString(),style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                fontSize: 15
              ),),
            ),
            const SizedBox(height: 20,),
            Obx(() =>  StatusButtons(text: 'PickedUp',selected: controller.pickedSelected.value,onTap: () => controller.selectPick(),),),
            const SizedBox(height: 20,),
            Obx(() =>  StatusButtons(text: 'Delivered',selected: controller.deliveredSelected.value,onTap: () => controller.selectDeliver(),),),
            const SizedBox(height: 20,),
            Obx(() =>  StatusButtons(text: 'Archive',selected: controller.archiveSelected.value,onTap: () => controller.selectArchive(),),),
            const SizedBox(height: 20,),
            Obx(() =>  StatusButtons(text: 'Cancel',selected: controller.cancelSelected.value,onTap: () => controller.selectCalcle(),),),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: LoadCardButton(text: 'Cancel', color: primaryColor, fontSize: 14,
                  height: 45,
                    width: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => LoadServices.updateStatus(snapshot: snapshot),
                  child: Obx(() => LoadCardButton(text: 'Update', color: primaryColor, fontSize: 14,
                    height: 45,
                    spinKitColor: Colors.white,
                    width: 100,
                    loading: controller.loading.value,
                  ),)
                )
              ],
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}






class StatusCardController extends GetxController{
  RxBool pickedSelected=false.obs;
  RxBool deliveredSelected=false.obs;
  RxBool archiveSelected=false.obs;
  RxBool cancelSelected=false.obs;
  RxBool loading=false.obs;
  
  selectPick(){
    pickedSelected.value=true;
    deliveredSelected.value=false;
    archiveSelected.value=false;
    cancelSelected.value=false;
  }


  selectDeliver(){
    pickedSelected.value=false;
    deliveredSelected.value=true;
    archiveSelected.value=false;
    cancelSelected.value=false;
  }
  
  
  selectArchive(){
    pickedSelected.value=false;
    deliveredSelected.value=false;
    archiveSelected.value=true;
    cancelSelected.value=false;
  }

  selectCalcle(){
    pickedSelected.value=false;
    deliveredSelected.value=false;
    archiveSelected.value=false;
    cancelSelected.value=true;
  }
}