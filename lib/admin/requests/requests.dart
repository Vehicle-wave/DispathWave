import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/constants.dart';
import '../../view/load_details/components/load_detail_header.dart';
import 'componetns/admin_req_card_data.dart';

class RequestsManage extends StatelessWidget {
  const RequestsManage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const LoadDetailHeader(text: 'All Requests',),
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
                  .ref('Requests'),
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
                            height: 430,
                            padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: AdminLoadCardData(snapshot: e)),
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








