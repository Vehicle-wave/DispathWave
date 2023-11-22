import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view/authentication/sign_up/components/input_field.dart';
import 'package:wave_dispatch/view/load_details/components/load_card_btn.dart';
import 'package:wave_dispatch/view/load_details/components/load_detail_header.dart';
import 'package:wave_dispatch/view_model/controller/appeal_controller.dart';

class Appeal extends StatelessWidget {
   Appeal({super.key, required this.dataSnapshot, required this.uid});
  final DataSnapshot dataSnapshot;
  final String uid;
  final controller=Get.put(AppealController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const LoadDetailHeader(text: 'Appeal'),
            const SizedBox(height: 30,),
            Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // InputField(hint: 'Enter Pickup Time', controller: controller.pickupTime.value),
                GestureDetector(
                  onTap: ()async{

                    final pickedDate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2080),);
                    if(pickedDate!=null){
                      final pickedTime=await showTimePicker(context: context, initialTime: TimeOfDay.now());
                      if(pickedTime!=null){
                        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                        String formatedTime='${pickedTime.hourOfPeriod}:${pickedTime.minute} ${pickedTime.period.name.toUpperCase()}';
                        controller.pickupTime.value= '$formatedTime  $formattedDate';
                      }else{
                        controller.pickupTime.value=='';
                      }
                    }else{
                      controller.pickupTime.value=='';
                    }

                  },
                  child: Obx(() => TimePickDialog(
                    text: controller.pickupTime.value,
                    hint: 'Select Pickup Time',
                  ),),
                ),
                const SizedBox(height: 20,),
                // InputField(hint: 'Enter Drop-off Time', controller: controller.dropTime.value),
                GestureDetector(
                  onTap: ()async{

                    final pickedDate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2080),);
                    if(pickedDate!=null){
                      final pickedTime=await showTimePicker(context: context, initialTime: TimeOfDay.now());
                      if(pickedTime!=null){
                        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                        String formatedTime='${pickedTime.hourOfPeriod}:${pickedTime.minute} ${pickedTime.period.name.toUpperCase()}';
                        controller.dropTime.value= '$formatedTime  $formattedDate';
                      }else{
                        controller.dropTime.value=='';
                      }
                    }else{
                      controller.dropTime.value=='';
                    }

                  },
                  child: Obx(() => TimePickDialog(
                    text: controller.dropTime.value,
                    hint: 'Select Drop-off Time',
                  ),),
                ),
                const SizedBox(height: 20,),
                InputField(hint: 'Driver Name', controller: controller.driverName),
                const SizedBox(height: 20,),
                InputField(hint: 'Contact (+123456789)', controller: controller.phoneNumber),
                const SizedBox(height: 20,),
                InputField(hint: 'Company Name', controller: controller.companyName),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                        child: LoadCardButton(text: 'Cancle', color: primaryColor, fontSize: 14,height: 40,width: 100,)),
                    Card(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(.1)
                          )
                        ),
                        child: Obx(() => GestureDetector(
                            onTap: controller.loading.value? null : () => controller.appeal(dataSnapshot,uid),
                            child: LoadCardButton(text: 'Appeal', color: Colors.white, fontSize: 14,height: 40,width: 100,textColor: primaryColor, loading: controller.loading.value,)))),

                  ],
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





class TimePickDialog extends StatelessWidget {
  const TimePickDialog({super.key, required this.text, this.onSelected, required this.hint});
  final String text;
  final String hint;
  final VoidCallback? onSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(.5)
        )
      ),
      child: Row(
        children: [
          text.isEmpty? Text(hint,style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 13
          ),): Text(text,style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 13
          ),),

          const Spacer(),
          const Icon(Icons.calendar_month,color: Colors.grey,)

        ],
      ),
    );
  }
}
