import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/utils/utils.dart';
import 'package:wave_dispatch/view/appeal/appeal.dart';

import '../../../res/constants.dart';
import 'instruction_col.dart';
import 'load_card.dart';
import 'load_card_btn.dart';

class LoadDetailCardInner extends StatelessWidget {
  LoadDetailCardInner({super.key, required this.dataSnapshot, required this.uid});
  final DataSnapshot dataSnapshot;
  final String uid;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Load ID',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            const Spacer(),
            Text(
              'Price',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'SBR ${dataSnapshot.child('order id').value}',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            const Spacer(),
            Text(
              '\$${dataSnapshot.child('Price').value}',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: 'Ship:  ',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          TextSpan(
              text: dataSnapshot
                  .child('estimatedPickup')
                  .value
                  .toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: primaryColor, fontSize: 13))
        ])),
        const SizedBox(
          height: 20,
        ),
        LoadCard(
            prefix: 'Pickup:   ',
            postFix: dataSnapshot
                .child('pickup address')
                .value
                .toString()),
        const SizedBox(
          height: 20,
        ),
        LoadCard(
            prefix: 'Drop-off:   ',
            postFix: dataSnapshot
                .child('dropff address')
                .value
                .toString()),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Special Instruction',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: primaryColor),
        ),
        const SizedBox(
          height: 10,
        ),
        InstructionColumn(prefix: 'Vehicle:  ', postFix:  '${dataSnapshot.child('vehicleData').child('0').child('make').value.toString()} ${dataSnapshot.child('vehicleData').child('0').child('model').value.toString()} ${dataSnapshot.child('vehicleData').child('0').child('year').value.toString()}',),
        const SizedBox(height: 5,),
        InstructionColumn(prefix: 'Shipper:  ', postFix:  '${dataSnapshot.child('cutomer_name').value.toString()}',check: true,),
        const SizedBox(height: 10,),
        Align(alignment: Alignment.topRight,
          child: Text('Terms and Conditions',style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: primaryColor
          ),),
        ),
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            GestureDetector(
                onTap: () => Get.back(),
                child: LoadCardButton(text: 'Decline', color: primaryColor, fontSize: 12)),
            const SizedBox(width: 10,),
            GestureDetector(
                onTap: () => Get.to(Appeal(dataSnapshot: dataSnapshot,uid: uid,)),
                child: LoadCardButton(text: 'Accept', color: primaryColor, fontSize: 14,width: 100,height: 40,)),
            const SizedBox(width: 10,),
            GestureDetector(
                onTap: () => Utils.showSnackBar('Warning', 'Not implemeted yet', Icon(Icons.warning_amber)),
                child: LoadCardButton(text: 'Request', color: primaryColor, fontSize: 12)),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}