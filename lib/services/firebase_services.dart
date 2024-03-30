import 'package:assignment/firestore_database/user_profile.dart';
import 'package:assignment/modules/home/home_screen.dart';
import 'package:assignment/modules/profile_creation/profile_creation.dart';
import 'package:assignment/modules/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFirebaseServices {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  loginWitheEmailandPassword(
      {required String email,
      required String password,
      required BuildContext context}) {
    try {
      _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        FDFetchUserProfile().fDFetchUserProfile();
      }).onError((error, stackTrace) {
        signUpwithEmailandPassword(
            email: email, password: password, context: context);
      });
    } catch (e) {}
  }

  signUpwithEmailandPassword(
      {required String email,
      required String password,
      required BuildContext context}) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Get.offAll(() => ProfileCompletion(
            email: email,
          ));
    }).onError((error, stackTrace) {
      CustomSnackBar()
          .errorSnackBar(context: context, content: "Please Check Credentials");
    });
  }
}
