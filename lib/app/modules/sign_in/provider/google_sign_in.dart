import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:traffix/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/model/user.dart';
import '../../../widgets/helper.dart';

class GoogleSignInProvider extends GetConnect {
  final googleSignIn = GoogleSignIn();
  SharedPreferences prefs;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = Firestore.instance;
  SignInController _signInController = Get.put(SignInController());
  Future loginWithGoogle({bool login}) async {
    try {
      final GoogleSignInAccount googleUser = (await GoogleSignIn().signIn());
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);


      final AuthResult

      authResult =
          await _auth.signInWithCredential(credential);

      final FirebaseUser user = authResult.user;
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
          Get.snackbar('Authentication', 'Logged In successfully.',
              backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
          prefs.setString("token", googleAuth.accessToken);
          Timer(Duration(seconds: 3),
              () => Get.offAllNamed(login ? Routes.SIGN_IN : Routes.HOME));
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
          prefs.setString("token", googleAuth.accessToken);
          Timer(Duration(seconds: 3),
              () => Get.offAllNamed(login ? Routes.HOME : Routes.SIGN_IN));
        }
      }).catchError((e) {
        Get.snackbar('Error', '$e',
            backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
      });
    } catch (e) {
      Get.snackbar('Error', '$e',
          backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
