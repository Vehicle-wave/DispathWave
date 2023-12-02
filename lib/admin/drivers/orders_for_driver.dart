import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:wave_dispatch/view/load_details/components/load_detail_header.dart';

import '../../res/constants.dart';
import '../../view/loads/assigned/components/load_data_card.dart';

class OrderForDriver extends StatelessWidget {
  const OrderForDriver({super.key, required this.uid});
  final String uid;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            LoadDetailHeader(text: 'Assigned Loads',),
            SizedBox(height: 20,),
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
                  .ref('Orders')
                  .child(uid),
              shrinkWrap: true,
              itemBuilder: (context, snapshot, animation, index) {
                if (snapshot.children.isNotEmpty) {
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Container(
                        height: 350,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: LoadCardData(snapshot: snapshot,show: false,)
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
            ))
          ],
        ),
      ),
    );
  }
}
