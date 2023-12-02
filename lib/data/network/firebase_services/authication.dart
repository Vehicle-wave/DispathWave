import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wave_dispatch/admin/home/home.dart';
import '../../../utils/utils.dart';
import '../../../view_model/controller/sign_in_controller.dart';
import '../../../view_model/controller/sign_up_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../user_pref/user_pref.dart';
class FirebaseAuthentication{
  static final auth=FirebaseAuth.instance;
  static Future<void> createAccount()async{
    final signUpController = Get.put(SignUpController());
    signUpController.loading.value = true;
    FirebaseStorage storage = FirebaseStorage.instance;
    var sRef = storage
        .ref('profile_picture/${DateTime.now().microsecondsSinceEpoch}.jpeg');
    var uploadTask = sRef.putFile(File(signUpController.image.value));
    await Future.value(uploadTask).then((v) async {
      sRef.getDownloadURL().then((url) {
        auth
            .createUserWithEmailAndPassword(
            email: signUpController.email.value.text.toString(),
            password: signUpController.password.value.text.toString())
            .then((value) {
          final String email = signUpController.email.value.text.toString();
          FirebaseDatabase.instance
              .ref('Accounts')
              .child('AdminAccounts')
              .child(email.substring(0, email.indexOf('@')))
              .set({
            'email': email,
            'profilePicture': url,
            'fullName': signUpController.fullName.value.text.toString(),
            'uid': value.user!.uid,
            'type': 'Admin'
          }).then((v) {
            UserPref.saveUser({
              'email': email,
              'profilePicture': url,
              'fullName': signUpController.fullName.value.text.toString(),
              'uid': value.user!.uid,
              'type': 'Admin'
            });

            Utils.showSnackBar('Success', 'Account is successfully Created',
                const Icon(Icons.done_all));
            Get.offAll(()=>HomeView());
            signUpController.loading.value = false;
          }).onError((error, stackTrace) {
            signUpController.loading.value = false;
            Utils.showSnackBar(
                'Error',
                Utils.extractFirebaseError(error.toString()),
                const Icon(Icons.warning_amber));
          });
        }).onError((error, stackTrace) {
          signUpController.loading.value = false;
          Utils.showSnackBar(
              'Error',
              Utils.extractFirebaseError(error.toString()),
              const Icon(Icons.warning_amber));
        });
      }).onError((error, stackTrace) {
        signUpController.loading.value = false;
        Utils.showSnackBar(
            'Error',
            Utils.extractFirebaseError(error.toString()),
            const Icon(Icons.warning_amber));
      });
    }).onError((error, stackTrace) {
      signUpController.loading.value = false;
      Utils.showSnackBar('Error', Utils.extractFirebaseError(error.toString()),
          const Icon(Icons.warning_amber));
    });
  }

  static Future<void> loginAccount()async{
    final signInController = Get.put(SignInController());
    signInController.loading.value = true;

    String email = signInController.email.value.text.toString();
    String password = signInController.password.value.text.toString();

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {

      FirebaseDatabase.instance
          .ref('Accounts')
          .child('AdminAccounts')
          .child(email.substring(0, email.indexOf('@')))
          .once()
          .then((value) {
        if(value.snapshot.child('type').value.toString()=='Admin'){
          final userSnapshot = value.snapshot;
          UserPref.saveUser({
            'fullName': userSnapshot.child('fullName').value.toString(),
            'email': userSnapshot.child('email').value.toString(),
            'profilePicture':
            userSnapshot.child('profilePicture').value.toString(),
            'uid': userSnapshot.child('uid').value.toString(),
            'type': 'Admin',
          });
          Utils.showSnackBar('Success', 'Successfully Login to your account',
              const Icon(Icons.done_all));
          signInController.loading.value = false;
          Get.offAll(()=>HomeView());
        }else{
          FirebaseAuth.instance.signOut();
          signInController.loading.value = false;
          Utils.showSnackBar('Error', 'Something went wrong try again',
              const Icon(Icons.warning_amber));
        }
      }).onError((error, stackTrace) {
        signInController.loading.value = false;
        Utils.showSnackBar('Error', 'Something went wrong try again',
            const Icon(Icons.warning_amber));
      });
    }).onError((error, stackTrace) {
      signInController.loading.value = false;
      Utils.showSnackBar('Error', 'Invalid Email or Password',
          const Icon(Icons.warning_amber));
    });
  }

}