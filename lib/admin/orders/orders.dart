import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../res/constants.dart';
import '../../view/load_details/components/load_card_btn.dart';
import '../../view/load_details/components/load_detail_header.dart';
import '../../view/loads/assigned/components/load_data_card.dart';
import '../drivers/orders_for_driver.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            LoadDetailHeader(text: 'All Orders',),
            SizedBox(height: 10,),
            Expanded(child: FirebaseAnimatedList(
              defaultChild: Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: SpinKit(
                    color: primaryColor,
                  ),
                ),
              ),
              query: FirebaseDatabase.instance
                  .ref('Orders'),
              shrinkWrap: true,
              itemBuilder: (context, snapshot, animation, index) {
                if (snapshot.children.isNotEmpty) {
                  return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ...snapshot.children.map((e) => Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Container(
                        height: 380,
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: LoadCardData(snapshot: e,show: false,)),
                  ))
                    ],
                  );
                } else {
                  return Text(
                    'No Loads',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
