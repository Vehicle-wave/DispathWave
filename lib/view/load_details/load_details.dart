import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'components/load_card_inner.dart';
import 'components/load_detail_header.dart';

class LoadDetails extends StatelessWidget {
  const LoadDetails({super.key, required this.dataSnapshot, required this.uid});
  final String uid;
  final DataSnapshot dataSnapshot;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadDetailHeader(),
            Card(
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(.1)),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 450,
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: LoadDetailCardInner(dataSnapshot: dataSnapshot,uid: uid),
              ),
            )
          ],
        ),
      ),
    );
  }
}











