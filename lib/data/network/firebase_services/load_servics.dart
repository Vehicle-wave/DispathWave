// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wave_dispatch/data/user_pref/user_pref.dart';
// import 'package:wave_dispatch/view/loads/assigned/components/update_widgets.dart';
// import 'package:wave_dispatch/view_model/controller/load_controller.dart';
//
// import '../../../res/constants.dart';
// import '../../../utils/utils.dart';
// import '../../../view/home/home_page.dart';
// class LoadServices{
//   static Future<void> updateStatus({required DataSnapshot snapshot})async{
//     final loadController=Get.put(StatusCardController());
//     loadController.loading.value=true;
//     if(loadController.pickedSelected.value){
//       snapshot.ref.child(snapshot.key!).update(
//         {
//           'status' : 'PickedUp',
//         }
//       ).then((value) {
//         FirebaseDatabase.instance.ref('Shipment').child(snapshot.child('clientUID').value.toString()).child(snapshot.key!).update({
//           'status' : 'PickedUp',
//         }).then((value){
//           loadController.loading.value=false;
//           Utils.showCustomDialog(
//             context: Get.context!,
//             text: 'status is successfully updated',
//             icon: Icon(
//               Icons.person_pin_outlined,
//               color: primaryColor,
//               size: 100,
//             ),
//             onTap: (){
//               Get.back();
//             },
//           );
//         }).onError((error, stackTrace) {
//           onErrorCall(loadController);
//         });
//       });
//     }else if(loadController.deliveredSelected.value){
//       snapshot.ref.child(snapshot.key!).update(
//           {
//             'status' : 'Delivered',
//           }
//       ).then((value) {
//         FirebaseDatabase.instance.ref('Shipment').child(snapshot.child('clientUID').value.toString()).child(snapshot.key!).update({
//           'status' : 'Delivered',
//         }).then((value){
//           loadController.loading.value=false;
//           Utils.showCustomDialog(
//             context: Get.context!,
//             text: 'status is successfully updated',
//             icon: Icon(
//               Icons.person_pin_outlined,
//               color: primaryColor,
//               size: 100,
//             ),
//             onTap: (){
//               Get.back();
//             },
//           );
//         }).onError((error, stackTrace) {
//           onErrorCall(loadController);
//         });
//       });
//     }else if(loadController.archiveSelected.value){
//       snapshot.ref.child(snapshot.key!).update(
//           {
//             'status' : 'Archived',
//           }
//       ).then((value) {
//         FirebaseDatabase.instance.ref('Shipment').child(snapshot.child('clientUID').value.toString()).child(snapshot.key!).update({
//           'status' : 'Archived',
//         }).then((value){
//           loadController.loading.value=false;
//           Utils.showCustomDialog(
//             context: Get.context!,
//             text: 'status is successfully updated',
//             icon: Icon(
//               Icons.person_pin_outlined,
//               color: primaryColor,
//               size: 100,
//             ),
//             onTap: (){
//               Get.back();
//             },
//           );
//
//         }).onError((error, stackTrace) {
//           onErrorCall(loadController);
//         });
//       });
//     }else if(loadController.cancelSelected.value){
//       showDialog(context: Get.context!, builder: (context) {
//         return AlertDialog(
//           titlePadding: const EdgeInsets.only(left: 20,top: 20),
//           title: const Text('Cancel Load'),
//           content: const Text('Are you sure to cancel this load. Your order will be cancled'),
//           actions: [
//             TextButton(onPressed: (){
//               loadController.loading.value=false;
//               Get.back();
//             }, child: const Text('Cancel')),
//             TextButton(onPressed: () async {
//
//               FirebaseDatabase.instance.ref('Drivers').child((await UserPref.getUser())['uid']!).child('Canceled').child(snapshot.key!).set(
//                 snapshot.value
//               ).then((value) {
//                 FirebaseDatabase.instance.ref('Shipment').child(snapshot.child('clientUID').value.toString()).child(snapshot.key!).update({
//                   'status' : 'Canceled',
//                 }).then((value){
//                   snapshot.ref.remove().then((value) {
//
//                     loadController.loading.value=false;
//                     Utils.showCustomDialog(
//                       context: Get.context!,
//                       text: 'Your assigned load is successfully canceled',
//                       icon: Icon(
//                         Icons.person_pin_outlined,
//                         color: primaryColor,
//                         size: 100,
//                       ),
//                       onTap: () => Get.offAll(() => HomePage()),
//                     );
//
//
//                   }).onError((error, stackTrace) {
//                     onErrorCall(loadController);
//                   });
//
//
//                 }).onError((error, stackTrace){
//                   onErrorCall(loadController);
//                 });
//               }).onError((error, stackTrace) {
//                 onErrorCall(loadController);
//               });
//             }, child: const Text('Confirm')),
//           ],
//         );
//       },);
//     }else{
//       loadController.loading.value=false;
//       Utils.showCustomDialog(
//         context: Get.context!,
//         text: 'Please select status to update',
//         icon: const Icon(
//           Icons.warning_amber,
//           color: Colors.red,
//           size: 100,
//         ),
//         onTap: () => Get.back(),
//       );
//     }
//   }
//
//
//   static onErrorCall(controller) {
//     Utils.showCustomDialog(
//       context: Get.context!,
//       text: 'Unable to send your request to the server. Please try again.',
//       icon: const Icon(
//         Icons.warning_amber,
//         color: Colors.red,
//         size: 100,
//       ),
//       onTap: () => Get.back(),
//     );
//     controller.loading.value = false;
//   }
//
//
//
// }
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/data/user_pref/user_pref.dart';
import 'package:wave_dispatch/view/loads/assigned/components/update_widgets.dart';
import '../../../res/constants.dart';
import '../../../utils/utils.dart';
import '../../../view/home/home_page.dart';
import '../../../view_model/controller/home_controller.dart';
class LoadServices {
  static Future<void> updateStatus({required DataSnapshot snapshot}) async {
    final loadController = Get.put(StatusCardController());
    loadController.loading.value = true;
    if (loadController.pickedSelected.value) {
      await _updateLoadStatus(snapshot, 'PickedUp', loadController);
    } else if (loadController.deliveredSelected.value) {
      await _updateLoadStatus(snapshot, 'Delivered', loadController);
    } else if (loadController.archiveSelected.value) {
      await _updateLoadStatus(snapshot, 'Archived', loadController);
    } else if (loadController.cancelSelected.value) {
      await _cancelLoad(snapshot, loadController);
    } else {
      _showStatusUpdateError(loadController);
    }
  }
  static Future<void> _updateLoadStatus(
      DataSnapshot snapshot, String status, StatusCardController loadController) async {
    await _updateDatabaseStatus(snapshot, status, loadController);
    _showStatusUpdateSuccess(loadController);
  }
  static Future<void> _updateDatabaseStatus(
      DataSnapshot snapshot, String status, StatusCardController loadController) async {
    await snapshot.ref.child(snapshot.key!).update({'status': status});

    await FirebaseDatabase.instance
        .ref('Shipment')
        .child(snapshot.child('clientUID').value.toString())
        .child(snapshot.key!)
        .update({'status': status});
  }
  static void _showStatusUpdateSuccess(StatusCardController loadController) {
    loadController.loading.value = false;
    Utils.showCustomDialog(
      context: Get.context!,
      text: 'Status is successfully updated',
      icon:  Icon(
        Icons.person_pin_outlined,
        color: primaryColor,
        size: 100,
      ),
      onTap: () {
        Get.back();
      },
    );
  }

  static void _showStatusUpdateError(StatusCardController loadController) {
    _onErrorCall(loadController);
  }

  static Future<void> _cancelLoad(DataSnapshot snapshot, StatusCardController loadController) async {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.only(left: 20, top: 20),
          title: const Text('Cancel Load'),
          content: const Text('Are you sure to cancel this load. Your order will be canceled'),
          actions: [
            TextButton(
              onPressed: () {
                loadController.loading.value = false;
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _confirmCancelLoad(snapshot, loadController);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  static Future<void> _confirmCancelLoad(DataSnapshot snapshot, StatusCardController loadController) async {
    await FirebaseDatabase.instance
        .ref('Drivers')
        .child((await UserPref.getUser())['uid']!)
        .child('Canceled')
        .child(snapshot.key!)
        .set(snapshot.value);


    await FirebaseDatabase.instance
        .ref('Cancelled')
        .child((await UserPref.getUser())['uid']!)
        .child(snapshot.key!)
        .set(snapshot.value);


    await _updateDatabaseStatus(snapshot, 'Canceled', loadController);
    await snapshot.ref.remove();

    _showStatusUpdateSuccess(loadController);
    Get.offAll(() => HomePage());
    final homeController=Get.put(HomeController());
    homeController.changePageIndex(0);
  }

  static void _onErrorCall(StatusCardController loadController) {
    _showStatusUpdateError(loadController);
  }
}
