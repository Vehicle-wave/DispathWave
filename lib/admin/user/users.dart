import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:wave_dispatch/view/loads/assigned/components/load_data_card.dart';

import '../../res/constants.dart';
import '../../view/load_details/components/load_detail_header.dart';
import '../requests/componetns/admin_req_card_data.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const LoadDetailHeader(text: 'User Shipments',),
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
                  .ref('Shipment'),
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
                            height: 350,
                            padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
