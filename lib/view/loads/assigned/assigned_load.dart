import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/view/loads/assigned/components/load_data_card.dart';
import 'package:wave_dispatch/view_model/controller/load_controller.dart';

class AssignedLoad extends StatelessWidget {
  AssignedLoad({super.key});

  final controller = Get.put(LoadController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.uid.isEmpty
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
                .child('AssignedLoads'),
            shrinkWrap: true,
            itemBuilder: (context, snapshot, animation, index) {
              if (snapshot.children.isNotEmpty) {
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height: 480,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: LoadCardData(snapshot: snapshot)
                  ),
                );
              } else {
                return Text(
                  'No Loads',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                );
              }
            },
          ));
  }
}
