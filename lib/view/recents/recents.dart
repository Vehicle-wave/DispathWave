import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../view_model/controller/load_controller.dart';
import 'components/recent_req_card.dart';

class RecentRequests extends StatelessWidget {
   RecentRequests({super.key});
  final controller = Get.put(LoadController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Text('Recent Request',style: TextStyle(
          color : primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 17
        ),),
        Expanded(child: Obx(() => controller.uid.isEmpty
            ? Container(
          color: Colors.grey,
        )
            : FirebaseAnimatedList(
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
              .ref('Drivers')
              .child(controller.uid.value)
              .child('Requests'),
          itemBuilder: (context, snapshot, animation, index) {
            if (snapshot.children.isNotEmpty) {
              return Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                    height: 400,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: RecentReqCard(snapshot: snapshot)
                ),
              );
            } else {
              return Center(
                child: Text(
                  'No Loads',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              );
            }
          },
        )))
      ],
    );
  }
}





