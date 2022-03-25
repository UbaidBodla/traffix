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

class EmailSignUpProvider extends GetConnect {
  SharedPreferences prefs;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = Firestore.instance;
  SignInController _signInController = Get.put(SignInController());

  Future registerWithEmail(String name, String email, String password) async {

    prefs = await SharedPreferences.getInstance();

    try {
      AuthResult userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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
          Map<String, dynamic> userData = _.data;
          _signInController.initCurrentUser(UserModel.fromJson(userData));
          Get.snackbar('Authentication', 'Registered successfully.',
              backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
          // prefs.setString("token", user.accessToken);


          Timer(
              Duration(seconds: 0), () => Get.offAllNamed(Routes.ADDLOCATION));
        } else {
          final FirebaseUser currentUser = await _auth.currentUser();

          UserModel userModel = UserModel(
              name: name,
              password: password,
              email: email,
              uid: currentUser.uid,
              image: currentUser.photoUrl);
          _signInController.initCurrentUser(userModel);
          GeneralHelper.saveUser(userModel.toJson());
          Get.snackbar('Authentication', 'Registered successfully.',
              backgroundColor: Color(0xFF221AAF), colorText: Colors.white);


          Timer(
              Duration(seconds: 3), () => Get.offAllNamed(Routes.SIGN_IN));
        }
      });
    } on AuthException catch (e) {
      if (e.code == 'weak-password') {

        Get.snackbar("Error", "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {

        Get.snackbar("Error", "The account already exists for that email.");
      }
    } catch (e) {
      switch(e.code){
        case "ERROR_WEAK_PASSWORD":
        Get.snackbar("Error", "Your password is too weak.");
        break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          Get.snackbar("Error", "Anonymous accounts are not enabled.");
          break;
        case "ERROR_INVALID_EMAIL":
          Get.snackbar("Error", "Your email is invalid.");
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          Get.snackbar("Error", "Mail is already in use on different account.");
          break;
        case "ERROR_INVALID_CREDENTIAL":
          Get.snackbar("Error", "Your email is invalid.");
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
