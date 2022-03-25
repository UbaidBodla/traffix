import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:traffix/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import '../../../data/model/user.dart';
import '../../../widgets/helper.dart';

class FBLoginProvider extends GetConnect {
  SharedPreferences prefs;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = Firestore.instance;
  SignInController _signInController = Get.put(SignInController());
  Future loginWithFB({bool login}) async {
    try {
      final plugin = FacebookLogin(debug: true);
      final FacebookLoginResult result = await plugin.logIn(permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ]);
      switch (result.status) {
        case FacebookLoginStatus.success:
          final FacebookAccessToken accessToken = result.accessToken;

          AuthCredential credential = FacebookAuthProvider.getCredential(
              accessToken: accessToken.token);
          final authResult = await _auth.signInWithCredential(credential);
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
              prefs.setString("fbToken", accessToken.token);
              Timer(
                  Duration(seconds: 3),
                  () => Get.offAllNamed(
                       Routes.HOME));
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
              prefs.setString("fbToken", accessToken.token);
              Timer(
                  Duration(seconds: 3),
                  () => Get.offAllNamed(
                       Routes.HOME ));
            }
          }).catchError((e) {
            Get.snackbar('Error', '$e',
                backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
          });

          break;
        case FacebookLoginStatus.cancel:
          Get.snackbar('Authentication Cancel', 'Login cancelled.',
              backgroundColor: Color(0xFF221AAF), colorText: Colors.white);

          break;
        case FacebookLoginStatus.error:
          Get.snackbar('Authentication Error', 'Failed to login.',
              backgroundColor: Color(0xFF221AAF), colorText: Colors.white);

          break;
      }
    } catch (e) {
      Get.snackbar('Error', '$e',
          backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
    }
  }

  void logout() async {
    // await plugin.disconnect();
    FirebaseAuth.instance.signOut();
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
