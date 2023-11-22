import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view/home/home_page.dart';
import 'package:wave_dispatch/view/load_details/components/load_detail_header.dart';
import 'package:wave_dispatch/view_model/controller/home_controller.dart';

class MakeAgreement extends StatelessWidget {
  const MakeAgreement({super.key, required this.snapshot});
  final DataSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            LoadDetailHeader(text: '',),
            Text('SBR ${snapshot.key!}',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 17),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:50),
              child: Text('This id has been assigned to you.\nThanks',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () async {
                final homeController=Get.put(HomeController());
                Get.offAll(()=>HomePage());
                homeController.changePageIndex(0);

              },
              child: Container(
                height: 45,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Check Board',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
