import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/data/user_pref/user_pref.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/utils/utils.dart';
import 'package:wave_dispatch/view/home/home_page.dart';
import 'package:wave_dispatch/view/request_status/components/aggrement_load.dart';
import 'package:wave_dispatch/view/request_status/components/make_aggrement.dart';
import 'package:wave_dispatch/view_model/controller/appeal_controller.dart';
import 'package:wave_dispatch/view_model/controller/home_controller.dart';

class AppealService {

  static Future<void> sendRequest(DataSnapshot dataSnapshot, String uid) async {
    final controller = Get.put(AppealController());
    controller.loading.value = true;

    final user = await UserPref.getUser();
    final userUid = user['uid']!;
    final userRef = FirebaseDatabase.instance.ref('Requests').child(userUid);
    final requestKey = dataSnapshot.key!;
    final requestRef = userRef.child(requestKey);
    final appealData = {
      'pickupTime': controller.pickupTime.value,
      'dropTime': controller.dropTime.value,
      'driverName': controller.driverName.value.text.toString(),
      'phoneNumber': controller.phoneNumber.value.text.toString(),
      'companyName': controller.companyName.value.text.toString(),
    };
    try {
      await userRef.child(requestKey).set(dataSnapshot.value);
      await requestRef.update({
        'driverUID': userUid,
        'clientUID': uid,
        'requestStatus': 'Pending',
      });
      await requestRef.child('driverData').set(await UserPref.getUser());
      await requestRef.child('AppealData').set(appealData);



      await FirebaseDatabase.instance.ref('Shipment').child(uid).child(dataSnapshot.key!).child('Requests').child(userUid).set(user);
      await FirebaseDatabase.instance.ref('Shipment').child(uid).child(dataSnapshot.key!).child('Requests').child(userUid).update(
        appealData
      );


      final driverRef = FirebaseDatabase.instance.ref('Drivers').child(userUid).child('Requests').child(requestKey);
      await driverRef.set(dataSnapshot.value);
      await driverRef.child('AppealData').set(appealData);
      await driverRef.update({
        'driverUID': userUid,
        'clientUID': uid,
        'requestStatus': 'Pending',
      });


      controller.loading.value = false;
      Utils.showCustomDialog(
        context: Get.context!,
        text: 'Your request for this load has been applied, and you will get a confirmation email and notification soon.',
        icon: Icon(
          Icons.person_pin_outlined,
          color: primaryColor,
          size: 100,
        ),
        onTap: (){
          Get.offAll(() => HomePage());
          final homeController=Get.put(HomeController());
          homeController.changePageIndex(0);
        },
      );
    } catch (error) {
      onErrorCall(controller);
    }
  }

  static onErrorCall(controller) {
    Utils.showCustomDialog(
      context: Get.context!,
      text: 'Unable to send your request to the server. Please try again.',
      icon: const Icon(
        Icons.warning_amber,
        color: Colors.red,
        size: 100,
      ),
      onTap: () => Get.back(),
    );
    controller.loading.value = false;
  }



  static Future<void> makeAgreement(DataSnapshot snapshot)async {
    final controller=Get.put(MakeAgreementController());
    controller.loading.value=true;
    final user = await UserPref.getUser();
    final userUid = user['uid']!;
    final userRef = FirebaseDatabase.instance.ref('Requests').child(userUid);
    final requestKey = snapshot.key!;
    final requestRef = userRef.child(requestKey);
    String uid=snapshot.child('clientUID').value.toString();


    try{

      final driverRef = FirebaseDatabase.instance.ref('Drivers').child(userUid).child('Requests').child(requestKey);
      await FirebaseDatabase.instance.ref('Drivers').child(userUid).child('AssignedLoads').child(requestKey).set(
          snapshot.value
      );


      await FirebaseDatabase.instance.ref('Drivers').child(userUid).child('AssignedLoads').child(requestKey).update({
        'requestStatus' : 'Accepted',
        'status' : 'Loaded',
        'driverUID': userUid,
        'clientUID': uid,
      });


      await FirebaseDatabase.instance.ref('Orders').child(userUid).child(requestKey).set(
          snapshot.value
      );
      await FirebaseDatabase.instance.ref('Orders').child(userUid).child(requestKey).update({
        'requestStatus' : 'Accepted',
        'status' : 'Loaded',
        'driverUID': userUid,
        'clientUID': uid,
      });





      await FirebaseDatabase.instance.ref('Shipment').child(uid).child(snapshot.key!).child('AssignedTo').set(
        snapshot.child('AppealData').value,
      );
      await FirebaseDatabase.instance.ref('Shipment').child(uid).child(snapshot.key!).child('AssignedTo').update({
        'status' : 'Loaded',
      });
      /// request accepted status change is request list of driver
      driverRef.update({
        'requestStatus' : 'Accepted',
      });
      controller.loading.value = false;

      Get.to(MakeAgreement(snapshot: snapshot,));

    }catch(e){
      onErrorCall(controller);
    }



  }


}





























// static Future<void> sendRequest(DataSnapshot dataSnapshot, String uid) async {
//   final controller = Get.put(AppealController());
//   controller.loading.value = true;
//   Map<dynamic, dynamic> data = dataSnapshot.value as Map<dynamic, dynamic>;
//
//
//
//
//   FirebaseDatabase.instance
//       .ref('Requests')
//       .child((await UserPref.getUser())['uid']!)
//       .child(dataSnapshot.key!)
//       .set(data)
//       .then((value) async {
//     FirebaseDatabase.instance
//         .ref('Requests')
//         .child((await UserPref.getUser())['uid']!)
//         .child(dataSnapshot.key!)
//         .update({
//       'driverUID': (await UserPref.getUser())['uid']!,
//       'clientUID': uid,
//       'requestStatus': 'Pending'
//     }).then((value) async {
//       FirebaseDatabase.instance
//           .ref('Requests')
//           .child((await UserPref.getUser())['uid']!)
//           .child(dataSnapshot.key!)
//           .child('driverData')
//           .set(await UserPref.getUser())
//           .then((value) async {
//
//
//         FirebaseDatabase.instance
//             .ref('Requests')
//             .child((await UserPref.getUser())['uid']!)
//             .child(dataSnapshot.key!).child('AppealData').set({
//           'pickupTime':  controller.pickupTime.value.text.toString(),
//           'dropTime':  controller.dropTime.value.text.toString(),
//           'driverName':  controller.driverName.value.text.toString(),
//           'phoneNumber' : controller.phoneNumber.value.text.toString(),
//           'companyName' : controller.companyName.value.text.toString()
//         }).then((value) async {
//
//
//
//
//           FirebaseDatabase.instance
//               .ref('Drivers')
//               .child((await UserPref.getUser())['uid']!)
//               .child('Requests')
//               .child(dataSnapshot.key!)
//               .set(data).then((value) async {
//           FirebaseDatabase.instance
//               .ref('Drivers')
//               .child((await UserPref.getUser())['uid']!)
//               .child('Requests')
//               .child(dataSnapshot.key!).child('AppealData').set({
//
//           'pickupTime':  controller.pickupTime.value.text.toString(),
//           'dropTime':  controller.dropTime.value.text.toString(),
//           'driverName':  controller.driverName.value.text.toString(),
//           'phoneNumber' : controller.phoneNumber.value.text.toString(),
//           'companyName' : controller.companyName.value.text.toString()
//           }).then((value){
//
//             controller.loading.value = false;
//             Utils.showCustomDialog(
//               context: Get.context!,
//               text:
//               'Your request for this load has been applied and you will get a confirmation email and notification soon.',
//               icon: Icon(
//                 Icons.person_pin_outlined,
//                 color: primaryColor,
//                 size: 100,
//               ),
//               onTap: () => Get.offAll(() => HomePage()),
//             );
//
//           }).onError((error, stackTrace) {
//             onErrorCall(controller);
//           });
//           }).onError((error, stackTrace) {
//           onErrorCall(controller);
//           });
//
//
//         }).onError((error, stackTrace) {
//           onErrorCall(controller);
//         });
//
//       }).onError((error, stackTrace) {
//         onErrorCall(controller);
//       });
//     }).onError((error, stackTrace) {
//       onErrorCall(controller);
//     });
//   }).onError((error, stackTrace) {
//     onErrorCall(controller);
//   });
// }