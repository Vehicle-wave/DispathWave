import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view/load_details/components/load_detail_header.dart';
import 'package:wave_dispatch/view/request_status/components/aggrement_load.dart';

class Approved extends StatelessWidget {
  const Approved({super.key, required this.dataSnapshot});
  final DataSnapshot dataSnapshot;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.done_all,color: Colors.grey,size: 100,),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text('Your request has been Approved. Go to proceed page to proceed forward',textAlign: TextAlign.center,style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,

                ),),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () => Get.to(()=>AggreementLoad(snapshot: dataSnapshot,)),
                child: Container(
                  height: 45,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Agreement',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              const SizedBox(height: 100,),
            ],
          ),
        ),
      ),
    );
  }
}

