import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';

import '../../../routes/app_pages.dart';
import '../../sign_in/controllers/sign_in_controller.dart';

class PasswordResetProvider extends GetConnect {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  SignInController _signInController = Get.put(SignInController());

  Future<void> resetPassword(String email) async {
    try {

      await _firebaseAuth.sendPasswordResetEmail(email: email).then((value)
      {
        Get.snackbar(
            'Success', 'Reset email have been successfully sent!');
        Timer(Duration(seconds: 3), () {
          Get.toNamed(Routes.SIGN_IN);
        });
      });
      print("here");
    } catch (e) {
      if (e.code == "ERROR_USER_NOT_FOUND") {

        Get.snackbar('Error', 'Email not found!');
      }
      if (e.code == "ERROR_INTERNAL_ERROR") {

        Get.snackbar('Error', 'Cannot change this email password');
      }
      print(e.code);
    }
  }
}
