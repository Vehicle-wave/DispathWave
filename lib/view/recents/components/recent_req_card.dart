import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:wave_dispatch/view/recents/components/details.dart';
import 'package:wave_dispatch/view/request_status/req_status.dart';
import 'package:wave_dispatch/view_model/controller/load_controller.dart';

import '../../../res/constants.dart';

class RecentReqCard extends StatelessWidget {
  RecentReqCard({super.key, required this.snapshot});
  final DataSnapshot snapshot;
  final controller=Get.put(LoadController());
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
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () => Get.to(()=>Details(snapshot: snapshot)),
              child: Container(
                height: 45,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('View Details',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Get.to(()=>RequestStatus(status: snapshot.child('requestStatus').value.toString(),snapshot: snapshot,)),
    child: Container(
                height: 45,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Check Status',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),const Spacer(),
          ],
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}