import 'package:get/get.dart';
import 'package:wave_dispatch/data/user_pref/user_pref.dart';

class ProfileController extends GetxController{
  RxMap userData={}.obs;


  ProfileController(){
getData();
  }

  getData()async{
    if(userData['uid']==null){
      userData.value=await UserPref.getUser();
    }
  }

}