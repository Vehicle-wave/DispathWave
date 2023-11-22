import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view/authentication/sign_up/components/input_field.dart';
import 'package:wave_dispatch/view/load_details/components/load_card_btn.dart';
import 'package:wave_dispatch/view/load_details/components/load_detail_header.dart';
import 'package:wave_dispatch/view_model/controller/edit_data_controller.dart';

class EditData extends StatelessWidget {
   EditData({super.key, required this.snapshot});
   final DataSnapshot snapshot;
   final controller=Get.put(EditDataController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            LoadDetailHeader(text: 'Edit Details',),
            Expanded(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  InputField(hint: 'Pickup Address', controller: controller.pickupAddress),
                  SizedBox(height: 10,),
                  InputField(hint: 'Pickup Contact', controller: controller.pickupContact),
                  SizedBox(height: 10,),
                  InputField(hint: 'Drop-of Address', controller: controller.dropAddress),
                  SizedBox(height: 10,),
                  InputField(hint: 'Drop-of Contact', controller: controller.dropContact),
                  SizedBox(height: 10,),
                  InputField(hint: 'Time', controller: controller.time),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () => controller.updateData(snapshot),
                    child:  Obx(() => LoadCardButton(text: 'Update', color: primaryColor, fontSize: 14,height: 45,width: 100,loading: controller.loading.value,spinKitColor: Colors.white,))
                    ,
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
