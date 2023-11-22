import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_dispatch/data/user_pref/user_pref.dart';
import 'package:wave_dispatch/res/constants.dart';
import 'package:wave_dispatch/utils/utils.dart';
import 'package:wave_dispatch/view/loads/assigned/components/update_widgets.dart';

class LoadController extends GetxController{
  RxInt selectedTab=0.obs;
  final pageController=PageController();
  Rx<DatabaseReference?> ref=null.obs;
  RxString uid=''.obs;


  LoadController(){
    setQuery();
  }
  changeTab(int index) async {
    selectedTab.value=index;
    pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    // uid.value=(await UserPref.getUser())['uid'].toString();
  }
  setQuery()async{
    // ref.value ??= FirebaseDatabase.instance.ref('Drivers').child((await UserPref.getUser())['uid']!).child('AssignedLoads');
    uid.value=(await UserPref.getUser())['uid'].toString();
  }

  onTapUpdate(DataSnapshot snapshot){
    Utils.showCustomDialog(context: Get.context!, text: '', icon: Icon(Icons.add),
    widget: UpdateStatusCard(snapshot: snapshot)

    );

  }
  onTapTracking(){
    Utils.showCustomDialog(context: Get.context!, text: 'This part is not implemented yet', icon: 
    const Icon(Icons.warning_amber,size: 100,color: Colors.red,),onTap: () => Get.back(),
    );
  }


}