import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/model/user.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/helper.dart';
import '../../sign_in/controllers/sign_in_controller.dart';

class EmailSignInProvider extends GetConnect {
  SharedPreferences prefs;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = Firestore.instance;
  SignInController _signInController = Get.put(SignInController());

  Future loginWithEmail(String email, String password) async {
    prefs = await SharedPreferences.getInstance();

    try {
      AuthResult userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final FirebaseUser user = userCredential.user;
      assert(!user.isAnonymous);
      final FirebaseUser currentUsers = await _auth.currentUser();

      assert(user.uid == currentUsers.uid);
      prefs = await SharedPreferences.getInstance();
      firestoreInstance
          .collection("Users")
          .document(currentUsers.uid)
          .get()
          .then((_) async {
        if (_.exists) {
          Map<String, dynamic>  userData = _.data;
          _signInController.initCurrentUser(UserModel.fromJson(userData));
          Get.snackbar('Authentication', 'Logged In successfully.',
              backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
          // prefs.setString("token", user.accessToken);

          Timer(
              Duration(seconds: 1), () => Get.offAllNamed(Routes.HOME));
        } else {
          final FirebaseUser currentUser = await _auth.currentUser();

          UserModel userModel = UserModel(
              name: currentUser.displayName,
              email: currentUser.email,

              uid: currentUser.uid,
              image: currentUser.photoUrl);
          _signInController.initCurrentUser(userModel);
          GeneralHelper.saveUser(userModel.toJson());
          Get.snackbar('Authentication', 'Logged In successfully.',
              backgroundColor: Color(0xFF221AAF), colorText: Colors.white);

          Timer(
              Duration(seconds: 1), () => Get.offAllNamed(Routes.SIGN_IN));
        }
      });
    } on AuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Error", "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "The account already exists for that email.");
      }
    } catch (e) {
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
          Get.snackbar("Error", "No account found in this email.");

          break;
        case "ERROR_WRONG_PASSWORD":
          Get.snackbar("Error", "Your password is wrong.");
          break;
        case "ERROR_USER_NOT_FOUND":
          Get.snackbar("Error", "User with this email doesn't exist.");

          break;
        case "ERROR_USER_DISABLED":
          Get.snackbar("Error", "User with this email has been disabled.");
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          Get.snackbar("Error", "Too many requests. Try again later.");

          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          Get.snackbar("Error", "Signing in with Email and Password is not enabled.");

          break;
        default:
          Get.snackbar("Error", "An undefined Error happened.");
      }
      print(e);
    }
  }

  // final FirebaseUser user = (await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password))
  //     .user;
  // final googleAuth = await user.getIdToken();
  // if (user != null) {
  //   _signInController.isLoading.value = false;
  //   Get.snackbar("Successful", "You're Logged In");
  //   Map body = {
  //     "name": user.displayName,
  //     "_uID": user.uid,
  //     "email": user.email,
  //     "image": user.photoUrl
  //   };
  //   firestoreInstance
  //       .collection("Users")
  //       .document(user.uid)
  //       .setData(body, merge: true)
  //       .then((_) => print("Success"));
  //   Get.offAllNamed(Routes.ADDLOCATION);
  //   prefs.setString("token", googleAuth.token);
  // } else {
  //   _signInController.isLoading.value = false;
  //   Get.snackbar("Error", "You're Need to try again");
  // }

}
