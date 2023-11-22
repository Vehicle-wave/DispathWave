import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/data/network/firebase_services/firebase_appeal_service.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/utils/utils.dart';
import 'package:wave_dispatch/view/home/home_page.dart';
import 'package:wave_dispatch/view_model/controller/edit_data_controller.dart';
import 'package:wave_dispatch/view_model/controller/home_controller.dart';

class UpdateDataService {
  static Future<void> updateData(DataSnapshot snapshot)async{
    final controller=Get.put(EditDataController());
    controller.loading.value=true;
    final data={
      'drop off contact' :controller.dropContact.value.text.toString(),
      'dropff address' :controller.dropAddress.value.text.toString(),
      'pickup address' :controller.pickupAddress.value.text.toString(),
      'pickup contact' :controller.pickupContact.value.text.toString(),
      'time' : controller.time.value
    };
    
   try{
     await snapshot.ref.child(snapshot.key!).update(data);
     await FirebaseDatabase.instance.ref('Shipment').child(snapshot.child('clientUID').value.toString()).child(snapshot.key!).update(data);
     controller.loading.value=false;
     Utils.showCustomDialog(context: Get.context!, text: 'Details are successfully updated', icon: Icon(Icons.done_all,color:primaryColor,size: 100,),
       onTap: () {
         Get.offAll(()=>HomePage());

       },
     );
   }catch(e){
     AppealService.onErrorCall(controller);
   }

  }
}