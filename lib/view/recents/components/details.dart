import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../res/constants.dart';
import '../../load_details/components/load_detail_header.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.snapshot});
  final DataSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const LoadDetailHeader(text: 'Details'),
            Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 500,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
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
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            'No payment received',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    snapshot
                                        .child('pickup address')
                                        .value
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      height: 0,
                                    ),
                                  ),
                                  Text(
                                    snapshot
                                        .child('pickup_location_type')
                                        .value
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      height: 0,
                                    ),
                                  ),
                                  Text(
                                    snapshot
                                        .child('estimatedPickup')
                                        .value
                                        .toString(),
                                    style: const TextStyle(height: 0),
                                  ),
                                  const Text(
                                    'Phone',
                                    style: TextStyle(height: 0),
                                  ),
                                  Text(
                                    snapshot
                                        .child('pickup contact')
                                        .value
                                        .toString(),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    snapshot
                                        .child('dropff address')
                                        .value
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      height: 0,
                                    ),
                                  ),
                                  Text(
                                    snapshot
                                        .child('dropoff_location_type')
                                        .value
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      height: 0,
                                    ),
                                  ),
                                  Text(
                                    snapshot
                                        .child('estimatedPickup')
                                        .value
                                        .toString(),
                                    style: const TextStyle(height: 0),
                                  ),
                                  const Text(
                                    'Phone',
                                    style: TextStyle(height: 0),
                                  ),
                                  Text(
                                    snapshot
                                        .child('drop off contact')
                                        .value
                                        .toString(),
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
                      Card(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text('Appeal Data',style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                              const SizedBox(height: 10,),
                              Text.rich(TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Driver Name :   ',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        color: primaryColor
                                    )
                                    ),
                                    TextSpan(
                                        text: snapshot.child('AppealData').child('driverName').value.toString(),style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        color: Colors.black
                                    )
                                    )
                                  ]
                              )),
                              Text.rich(TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Company Name :   ',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        color: primaryColor
                                    )
                                    ),
                                    TextSpan(
                                        text: snapshot.child('AppealData').child('companyName').value.toString(),style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        color: Colors.black
                                    )
                                    )
                                  ]
                              )),
                              Text.rich(TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Phone Number :   ',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        color: primaryColor
                                    )
                                    ),
                                    TextSpan(
                                        text: snapshot.child('AppealData').child('phoneNumber').value.toString(),style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        color: Colors.black
                                    )
                                    )
                                  ]
                              )),
                              Text.rich(TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Pick Time :   ',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        color: primaryColor
                                    )
                                    ),
                                    TextSpan(
                                        text: snapshot.child('AppealData').child('pickupTime').value.toString(),style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        color: Colors.black
                                    )
                                    )
                                  ]
                              )),
                              Text.rich(TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Drop Time :   ',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        color: primaryColor
                                    )
                                    ),
                                    TextSpan(
                                        text: snapshot.child('AppealData').child('dropTime').value.toString(),style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        color: Colors.black
                                    )
                                    )
                                  ]
                              )),
                            ],
                          ),
                        ),
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
