import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/constants.dart';

class Rejected extends StatelessWidget {
  const Rejected({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.close_sharp,color: Colors.red,size: 100,),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text('Your request has been Declined. Go back to Load details and Try again',textAlign: TextAlign.center,style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,

                ),),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  height: 45,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Back',style: TextStyle(
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
