import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  static saveUser(Map<String, String> user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('fullName', user['fullName']!);
    pref.setString('profilePicture', user['profilePicture']!);
    pref.setString('email', user['email']!);
    pref.setString('uid', user['uid']!);
    pref.setString('type', user['type']!);
  }

  static Future<Map<String, String?>> getUser() async {
    Map<String, String?> user;
    SharedPreferences pref = await SharedPreferences.getInstance();
    user = {
      'fullName': pref.getString('fullName'),
      'profilePicture': pref.getString('profilePicture'),
      'email': pref.getString('email'),
      'uid': pref.getString('uid'),
      'type': pref.getString('type'),
    };
    return user;
  }

  static clearUser() async {
    FirebaseAuth.instance.signOut();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}