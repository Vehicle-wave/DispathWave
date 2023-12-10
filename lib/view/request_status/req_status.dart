import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wave_dispatch/view/load_details/components/load_detail_header.dart';
import 'package:wave_dispatch/view/request_status/components/approved.dart';
import 'package:wave_dispatch/view/request_status/components/pending.dart';
import 'package:wave_dispatch/view/request_status/components/rejected.dart';

class RequestStatus extends StatelessWidget {
  const RequestStatus({super.key, this.status, required this.snapshot});
  final String? status;
  final DataSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const LoadDetailHeader(text: 'Approval',),
            Expanded(child: status=='Accepted'? Approved(dataSnapshot: snapshot,) : status=='Rejected'? Rejected() :status=='Pending'?Pending() :Pending()  )
          ],
        ),
      ),
    );
  }
}
