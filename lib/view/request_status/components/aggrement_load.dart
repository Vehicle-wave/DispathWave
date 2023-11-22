import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/data/network/firebase_services/firebase_appeal_service.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view/load_details/components/load_detail_header.dart';

class AggreementLoad extends StatelessWidget {
   AggreementLoad({super.key, required this.snapshot});
  final DataSnapshot snapshot;
  final controller=Get.put(MakeAgreementController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoadDetailHeader(text: 'Take Load',),
            const SizedBox(height: 10,),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Special Instructions',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text('You must use POCKET DISPATCH  to deliver and chat. You should on your location every second. Special Inspection Required- means 6 pictures at pick up and drop off',
                        textAlign: TextAlign.center,style: TextStyle(
                            color: Colors.black
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text('Vehicle',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),),
                    const SizedBox(height: 10,),
                    Text('${snapshot.child('vehicleData').child('0').child('make').value.toString()} ${snapshot.child('vehicleData').child('0').child('year').value.toString()}',style: TextStyle(
                      color: primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),),
                    Container(
                      height: 5,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.green,
                                child: Center(
                                  child: Icon(Icons.done,color: Colors.white,),
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Text.rich(TextSpan(
                                  children: [
                                    const TextSpan(
                                        text: 'This offer was ',style: TextStyle(
                                      color: Colors.black,
                                    )
                                    ),
                                    TextSpan(
                                        text: 'accepted',style: TextStyle(
                                      color: primaryColor,
                                    )
                                    )
                                  ]
                              ))
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.green,
                                child: Center(
                                  child: Icon(Icons.done,color: Colors.white,),
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Text.rich(TextSpan(
                                  children: [
                                    const TextSpan(
                                        text: 'Assigned to ',style: TextStyle(
                                      color: Colors.black,
                                    )
                                    ),
                                    TextSpan(
                                        text: 'you',style: TextStyle(
                                      color: primaryColor,
                                    )
                                    )
                                  ]
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: (){
                          AppealService.makeAgreement(snapshot);
                        },
                        child: Container(
                          height: 45,
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Obx(() => controller.loading.value ? const Center(
                            child: SizedBox(height: 20,width: 20,child: SpinKit(color: Colors.white,),),
                          ) :const Text('Agreement',style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}


class MakeAgreementController extends GetxController{
  RxBool loading=false.obs;
}
