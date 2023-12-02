import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/admin/drivers/orders_for_driver.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view/load_details/components/load_card_btn.dart';
import 'package:wave_dispatch/view/load_details/components/load_detail_header.dart';

class Drivers extends StatelessWidget {
  const Drivers({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            LoadDetailHeader(text: 'Drivers',),
            SizedBox(height: 10,),
            Expanded(child: FirebaseAnimatedList(
              defaultChild: Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: SpinKit(color: primaryColor,),
                ),
              ),
              query: FirebaseDatabase.instance.ref('Accounts').child('DriverAccounts'), itemBuilder: (context, snapshot, animation, index){
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
                              placeholder: (context, url) => SizedBox(
                                height: 20,
                                width: 20,
                                child: SpinKit(
                                  color: primaryColor,
                                ),
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
