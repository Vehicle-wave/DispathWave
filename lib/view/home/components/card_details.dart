import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../res/constants.dart';

class HomeCardDetails extends StatelessWidget {
   HomeCardDetails({super.key, required this.dataSnapshot});
   final DataSnapshot dataSnapshot;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      color: Colors.white,
      elevation: 3,
      child: ClipRect(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: primaryColor
                        )
                    ),
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: primaryColor,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                          children: [
                            TextSpan(
                                text: 'Load Id ',
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: Colors.black,
                                    fontSize: 15
                                )
                            ),
                            TextSpan(
                                text: ' SBR ${dataSnapshot.child('order id').value.toString()}',
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                )
                            )
                          ]
                      )),
                      Text(
                        '${dataSnapshot.child('vehicleData').child('0').child('year').value.toString()} ${dataSnapshot.child('vehicleData').child('0').child('make').value.toString()}'
                        ,style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: primaryColor,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: 'Ship date ',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.black,
                            fontSize: 15
                        )
                    ),
                    TextSpan(
                        text: dataSnapshot.child('estimatedPickup').value.toString(),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        )
                    )
                  ]
              )),
              const SizedBox(height: 10,),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text('\$${dataSnapshot.child('Price').value.toString()}',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 0
                        ),),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_searching_rounded,color: primaryColor,),
                                    const SizedBox(width: 10,),
                                    Text(dataSnapshot.child('pickup address').value.toString(),overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Container(height: 20,
                        width: 1,
                        margin: const EdgeInsets.only(left: 11),
                        color: primaryColor,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_searching_rounded,color: primaryColor,),
                                    const SizedBox(width: 10,),
                                    Text(dataSnapshot.child('dropff address').value.toString(),overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
