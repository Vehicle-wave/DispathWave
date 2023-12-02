import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/view/edit/edit.dart';
import 'package:wave_dispatch/view_model/controller/load_controller.dart';

import '../../../../res/constants.dart';

class LoadCardData extends StatelessWidget {
   LoadCardData({super.key, required this.snapshot,this.show=true});
  final DataSnapshot snapshot;
  final controller=Get.put(LoadController());
  final bool show;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Card(
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Text('SBR ${snapshot.key}'),
              ),
            ),
            const Spacer(),
            Text(
              '\$${snapshot.child('Price').value.toString()}',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: primaryColor),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              '${snapshot.child('vehicleData').child('0').child('make').value.toString()} ${snapshot.child('vehicleData').child('0').child('year').value.toString()}',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(),
            Text(
              'No payment received',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.black,),
            )
          ],
        ),
        const SizedBox(height: 10,),
        Text('View Shipper details',style: Theme.of(context)
            .textTheme.labelSmall!.copyWith(
            color: primaryColor,
            decorationColor: primaryColor,
            decoration: TextDecoration.underline
        ),),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              child: Container(
                width: 120,
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 5,),
                    const Text('Origin',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),),
                    const Spacer(),
                    Text(snapshot.child('pickup address').value.toString(),textAlign: TextAlign.center,style: const TextStyle(
                      height: 0,
                    ),),
                    Text(snapshot.child('pickup_location_type').value.toString(),textAlign: TextAlign.center,style: const TextStyle(
                      height: 0,
                    ),),
                    Text(snapshot.child('estimatedPickup').value.toString(),style: const TextStyle(
                      height: 0
                    ),),
                    const Text('Phone',style: TextStyle(
                        height: 0
                    ),),
                    Text(snapshot.child('pickup contact').value.toString(),style: const TextStyle(
                        height: 0
                    ),),
                    const Spacer(flex: 2,),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                width: 120,
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 5,),
                    const Text('Destination',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                    const Spacer(),
                    Text(snapshot.child('dropff address').value.toString(),textAlign: TextAlign.center,style: const TextStyle(
                      height: 0,
                    ),),
                    Text(snapshot.child('dropoff_location_type').value.toString(),textAlign: TextAlign.center,style: const TextStyle(
                      height: 0,
                    ),),
                    Text(snapshot.child('estimatedPickup').value.toString(),style: const TextStyle(
                        height: 0
                    ),),
                    const Text('Phone',style: TextStyle(
                        height: 0
                    ),),
                    Text(snapshot.child('drop off contact').value.toString(),style: const TextStyle(
                        height: 0
                    ),),
                    const Spacer(flex: 2,),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10,),
       if(show) Center(child: Text(snapshot.child('status').value.toString(),style: TextStyle(
          fontWeight: FontWeight.bold
        ),)),
        const SizedBox(height: 10,),
       if(show) Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Get.to(()=>EditData(snapshot: snapshot)),
              child: Container(
                height: 45,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Edit',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
            GestureDetector(
              onTap: () => controller.onTapTracking(),
              child: Container(
                height: 45,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Tracking',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ],
        ),
        if(show) SizedBox(height: 10,),
        if(show) GestureDetector(
          onTap: () => controller.onTapUpdate(snapshot),
          child: Container(
            height: 45,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('Update Status',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ],
    );
  }
}
