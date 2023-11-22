import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/data/network/firebase_services/update_data_service.dart';
import 'package:wave_dispatch/utils/utils.dart';

class EditDataController extends GetxController{
  final pickupAddress=TextEditingController();
  final dropAddress=TextEditingController();
  final pickupContact=TextEditingController();
  final dropContact=TextEditingController();
  final time=TextEditingController();

  RxBool loading=false.obs;


  updateData(DataSnapshot snapshot){

    if(pickupAddress.value.text.toString().isEmpty){
      Utils.showSnackBar('Warning', 'Enter pickup Address', Icon(Icons.warning_amber));
      return;
    }
    if(dropAddress.value.text.toString().isEmpty){
      Utils.showSnackBar('Warning', 'Enter Drop-of Contact', Icon(Icons.warning_amber));
      return;
    }
    if(pickupContact.value.text.toString().isEmpty){
      Utils.showSnackBar('Warning', 'Enter pickup Contact', Icon(Icons.warning_amber));
      return;
    }
    if(dropContact.value.text.toString().isEmpty){
      if(pickupContact.value.text.toString().isEmpty){
        Utils.showSnackBar('Warning', 'Enter Drop-of Contact', Icon(Icons.warning_amber));
        return;
      }
    }
    if(pickupContact.value.text.toString().isEmpty){
      Utils.showSnackBar('Warning', 'Enter Time', Icon(Icons.warning_amber));
      return;
    }

    UpdateDataService.updateData(snapshot);

  }


}