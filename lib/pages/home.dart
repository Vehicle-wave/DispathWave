import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wave_dispatch/components/loads_container.dart';
import 'package:wave_dispatch/utils/constants.dart';
import 'package:wave_dispatch/utils/custom_paint.dart';

class DispatchHome extends StatefulWidget {
  const DispatchHome({super.key});

  @override
  State<DispatchHome> createState() => _DispatchHomeState();
}

class _DispatchHomeState extends State<DispatchHome> {
  final _auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.ref('Shipment');
  StreamController<List<dynamic>> streamController =
      StreamController<List<dynamic>>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: const Drawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: primaryColor),
          elevation: 0,
          backgroundColor: secondaryColor,
          title: Text(
            'Dispatch Wave',
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          width: 430,
                          height: 265,
                          color: primaryColor,
                        )
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: StreamBuilder(
                        stream: databaseReference.onValue,
                        builder:
                            (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: Container(
                                height: 400,
                                width: 400,
                                child: spinkit,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData) {
                            return Container(child: Text('No Loads'));
                          } else {
                            Map<dynamic, dynamic>? map = snapshot
                                .data?.snapshot.value as Map<dynamic, dynamic>?;
                            if (map == null) {
                              return Container(
                                  child: Text('No data available'));
                            }
                            List<String> userIds =
                                map.keys.cast<String>().toList();
                            List<Widget> allorders = [];
                            for (String userId in userIds) {
                              Map<dynamic, dynamic>? userData = map[userId];
                              if (userData == null) continue;
                              List<String> orderIds =
                                  userData.keys.cast<String>().toList();
                              for (String orderId in orderIds) {
                                Map<dynamic, dynamic>? orderData =
                                    userData[orderId];
                                if (orderData == null) continue;
                                allorders.add(
                                    MyLoadContainerWidget(loadData: orderData));
                              }
                            }

                            return ListView(
                              shrinkWrap: true,
                              children: allorders,
                            );
                          }
                        }))
              ],
            )),
      ),
    );
  }
}
