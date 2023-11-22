import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wave_dispatch/data/network/firebase_services/firebase_appeal_service.dart';
import 'package:wave_dispatch/utils/utils.dart';
class AppealController extends GetxController{

  // Rx<TextEditingController> pickupTime=TextEditingController().obs;
  // Rx<TextEditingController> dropTime=TextEditingController().obs;
  final driverName=TextEditingController();
  final companyName=TextEditingController();
  final phoneNumber=TextEditingController();
  RxString pickupTime=''.obs;
  RxString dropTime=''.obs;
  RxBool loading=false.obs;


  appeal(DataSnapshot dataSnapshot,String uid)async{
    if(pickupTime.isEmpty){
      Utils.showSnackBar('Warning', 'Enter Pickup Time', Icon(Icons.warning_amber));
      return;
    }
    if(dropTime.isEmpty){
      Utils.showSnackBar('Warning', 'Enter Drop-off Time', Icon(Icons.warning_amber));
      return;
    }
    if(driverName.value.text.toString().isEmpty){
      Utils.showSnackBar('Warning', 'Enter Driver Name', Icon(Icons.warning_amber));
      return;
    }
    if(phoneNumber.value.text.toString().isEmpty){
      Utils.showSnackBar('Warning', 'Enter Phone Number', Icon(Icons.warning_amber));
      return;
    }
    if(companyName.value.text.toString().isEmpty){
      Utils.showSnackBar('Warning', 'Enter Company Name', Icon(Icons.warning_amber));
      return;
    }


    AppealService.sendRequest(dataSnapshot, uid);

  }



}