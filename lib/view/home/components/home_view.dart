import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view/home/components/card_details.dart';
import 'package:wave_dispatch/view/home/components/home_top_header.dart';
import 'package:wave_dispatch/view/load_details/load_details.dart';

class HomeView extends StatelessWidget {
   const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: 10,),
        Center(
          child: Container(
            height: 40,
            width: 110,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(40)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search,color: Colors.white,),
                SizedBox(width: 5,),
                Text('Search',style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
        ),
        Expanded(child: Container(
          color: Colors.white,
          child: FirebaseAnimatedList(
            defaultChild: Center(
              child: SizedBox(height: 20,width: 20,child: SpinKit(color: primaryColor,)),
            ),
            query: FirebaseDatabase.instance.ref('Shipment'),
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, snapshot, animation, index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ...snapshot.children.map((dataSnapshot) {
                  return GestureDetector(
                      onTap: () => Get.to(LoadDetails(dataSnapshot: dataSnapshot, uid: snapshot.key.toString(),)),
                      child: HomeCardDetails(dataSnapshot: dataSnapshot));
                })
              ],
            );
          },),
        ))
      ],
    );
  }
}