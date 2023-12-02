import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/utils/utils.dart';

import '../../../res/constants.dart';

class AdminLoadCardData extends StatelessWidget {
  const AdminLoadCardData({super.key, required this.snapshot});

  final DataSnapshot snapshot;

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: primaryColor, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              'No payment received',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.black,
                  ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'View Shipper details',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: primaryColor,
              decorationColor: primaryColor,
              decoration: TextDecoration.underline),
        ),
        const SizedBox(
          height: 10,
        ),
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
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Origin',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      snapshot.child('pickup address').value.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 0,
                      ),
                    ),
                    Text(
                      snapshot.child('pickup_location_type').value.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 0,
                      ),
                    ),
                    Text(
                      snapshot.child('estimatedPickup').value.toString(),
                      style: const TextStyle(height: 0),
                    ),
                    const Text(
                      'Phone',
                      style: TextStyle(height: 0),
                    ),
                    Text(
                      snapshot.child('pickup contact').value.toString(),
                      style: const TextStyle(height: 0),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
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
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Destination',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      snapshot.child('dropff address').value.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 0,
                      ),
                    ),
                    Text(
                      snapshot.child('dropoff_location_type').value.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 0,
                      ),
                    ),
                    Text(
                      snapshot.child('estimatedPickup').value.toString(),
                      style: const TextStyle(height: 0),
                    ),
                    const Text(
                      'Phone',
                      style: TextStyle(height: 0),
                    ),
                    Text(
                      snapshot.child('drop off contact').value.toString(),
                      style: const TextStyle(height: 0),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
            child: Text(
          snapshot.child('requestStatus').value.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => showCustomDialog(
                  onTap: () => onTapRejected(snapshot),
                  context: context,
                  request: 'Reject'),
              child: Container(
                height: 45,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Reject',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => showCustomDialog(
                  onTap: () => onTapAccepted(snapshot),
                  context: context,
                  request: 'Accept'),
              child: Container(
                height: 45,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Accept',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  onTapRejected(DataSnapshot snapshot) async {
    Get.back();
    Utils.showSnackBar('Request', 'Your request has been send to server', Icon(Icons.done_all));
    updateOnFirebase(snapshot, 'Rejected');
  }


  onTapAccepted(DataSnapshot snapshot){
    Get.back();
    Utils.showSnackBar('Request', 'Your request has been send to server', Icon(Icons.done_all));
    updateOnFirebase(snapshot, 'Accepted');
  }


  updateOnFirebase(DataSnapshot snapshot,String status) async {
    await FirebaseDatabase.instance
        .ref('Requests')
        .child(snapshot.child('driverUID').value.toString())
        .child(snapshot.key!)
        .update({'requestStatus': status});
    await FirebaseDatabase.instance
        .ref('Drivers')
        .child(snapshot.child('driverUID').value.toString())
        .child('Requests')
        .child(snapshot.key!)
        .update({'requestStatus': status});
    await FirebaseDatabase.instance
        .ref('Shipment')
        .child(snapshot.child('clientUID').value.toString())
        .child(snapshot.key!)
        .child('Requests')
        .child(snapshot.child('driverUID').value.toString())
        .update({'requestStatus': status});


    Utils.showSnackBar('Request', 'Your request is updated', Icon(Icons.done_all));

  }
  showCustomDialog(
      {required VoidCallback onTap,
      required BuildContext context,
      required String request}) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            request + ' Request',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          content:
              Text('Are you sure to ${request.toLowerCase()} this request'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: onTap,
              child: Text(request),
            ),
          ],
        );
      },
    );
  }
}
