import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../res/constants.dart';
import '../../view/load_details/components/load_card_btn.dart';
import '../../view/load_details/components/load_detail_header.dart';
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
                  child: SpinKit(color: primaryColor,),
                ),
              ),
              query: FirebaseDatabase.instance.ref('Orders'), itemBuilder: (context, snapshot, animation, index){
              return Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(imageUrl: snapshot.child('profilePicture').value.toString(),
                              imageBuilder: (context, imageProvider) => CircleAvatar(
                                radius:25,
                                backgroundImage: imageProvider,
                              ),
                              placeholder: (context, url) => SpinKit(
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.child('fullName').value.toString(),style: const TextStyle(
                                    color: Colors.black,fontWeight: FontWeight.bold,
                                    fontSize: 14
                                ),),
                                Text(snapshot.child('email').value.toString(),style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                ),),
                              ],
                            )
                          ],
                        ),
                        GestureDetector(
                            onTap: () => Get.to(OrderForDriver(uid: snapshot.child('uid').value.toString())),
                            child: LoadCardButton(text: 'Orders >>', color: primaryColor, fontSize: 12,))
                      ],
                    ),
                  ),
                ),
              );
            },))
          ],
        ),
      ),
    );
  }
}
