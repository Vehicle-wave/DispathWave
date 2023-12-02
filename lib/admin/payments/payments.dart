import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/res/assets/app_images.dart';
import 'package:wave_dispatch/view/load_details/components/load_detail_header.dart';

import '../../res/constants.dart';

class Payments extends StatelessWidget {
  const Payments({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [
            LoadDetailHeader(text: 'Payments',),
        Expanded(child: Center(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  Container(
                height: 400,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                    color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.logo),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('No payment gateway is integrated yet! we are working on it',textAlign: TextAlign.center,style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black,
                      ),),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(onTap: () => Get.back(),
                      child: Card(
                        color: Colors.white,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(.2)
                            )
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Text( 'Ok',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )),
            SizedBox(height: 80,)
          ],
        ),
      ),
    );
  }
}
