// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_twitter_login/flutter_twitter_login.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:traffix/app/modules/sign_in/controllers/sign_in_controller.dart';
// import 'package:traffix/app/routes/app_pages.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../data/model/user.dart';
// import '../../../widgets/helper.dart';

// class TwitterLoginProvider extends GetConnect {
//   SharedPreferences prefs;
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   final firestoreInstance = Firestore.instance;
//   SignInController _signInController = Get.put(SignInController());

//   Future loginWithTwitter({bool login}) async {
//     try {
//       _signInController.isLoading.value = true;
//       final TwitterLogin twitterLogin = new TwitterLogin(
//         consumerKey: 'VLHZDyBzZN4jCtWivu0gsrF5v',
//         consumerSecret: 'giMJBSteIpjBr6SpD0O4KxLm3OXZX7EEjmNFt4xavaRBxrHXem',
//       );

//       final TwitterLoginResult result = await twitterLogin.authorize();
//       switch (result.status) {
//         case TwitterLoginStatus.loggedIn:
//           AuthCredential credential = TwitterAuthProvider.getCredential(
//               authToken: result.session.token,
//               authTokenSecret: result.session.secret);
//           final authResult = await _auth.signInWithCredential(credential);
//           final FirebaseUser user = authResult.user;
//           assert(!user.isAnonymous);
//           final FirebaseUser currentUsers = await _auth.currentUser();

//           assert(user.uid == currentUsers.uid);

//           prefs = await SharedPreferences.getInstance();

//           firestoreInstance
//               .collection("Users")
//               .document(currentUsers.uid)
//               .get()
//               .then((_) async {
//             if (_.exists) {
//               Map<String, dynamic> userData = _.data;
//               _signInController.initCurrentUser(UserModel.fromJson(userData));
//               Get.snackbar('Authentication', 'Logged In successfully.',
//                   backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
//               prefs.setString("twitterToken", result.session.token);
//               _signInController.isLoading.value = false;
//               Timer(
//                   Duration(seconds: 3),
//                   () => Get.offAllNamed(
//                       login ? Routes.HOME : Routes.ADDLOCATION));
//             } else {
//               final FirebaseUser currentUser = await _auth.currentUser();

//               UserModel userModel = UserModel(
//                   name: currentUser.displayName,
//                   email: currentUser.email,
//                   uid: currentUser.uid,
//                   image: currentUser.photoUrl);
//               _signInController.initCurrentUser(userModel);
//               GeneralHelper.saveUser(userModel.toJson());
//               Get.snackbar('Authentication', 'Logged In successfully.',
//                   backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
//               prefs.setString("twiterToken", result.session.token);
//               _signInController.isLoading.value = false;
//               Timer(
//                   Duration(seconds: 3),
//                   () => Get.offAllNamed(
//                       login ? Routes.HOME : Routes.ADDLOCATION));
//             }
//           }).catchError((e) {
//             Get.snackbar('Error', '$e',
//                 backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
//           });
//           _signInController.isLoading.value = false;
//           break;
//         case TwitterLoginStatus.cancelledByUser:
//           Get.snackbar('Authentication Cancel', 'Login cancelled.',
//               backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
//           _signInController.isLoading.value = false;
//           break;
//         case TwitterLoginStatus.error:
//           Get.snackbar('Authentication', 'Error Occured',
//               backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
//           _signInController.isLoading.value = false;
//           break;
//       }
//     } catch (e) {
//       Get.snackbar('Error', '$e',
//           backgroundColor: Color(0xFF221AAF), colorText: Colors.white);
//       _signInController.isLoading.value = false;
//     }
//   }

//   void logout() async {
//     // await plugin.disconnect();
//     FirebaseAuth.instance.signOut();
//     prefs = await SharedPreferences.getInstance();
//     prefs.clear();
//   }

//   Future registerWithEmail(String name, String email, String password) async {
//     _signInController.isLoading.value = true;
//     prefs = await SharedPreferences.getInstance();
//     final FirebaseUser user = (await FirebaseAuth.instance
//             .signInWithEmailAndPassword(email: email, password: password))
//         .user;
//     final googleAuth = await user.getIdToken();
//     if (user != null) {
//       _signInController.isLoading.value = false;
//       Get.snackbar("Successful", "You're Logged In");
//       Map body = {
//         "name": user.displayName,
//         "_uID": user.uid,
//         "email": user.email,
//         "image": user.photoUrl
//       };
//       firestoreInstance
//           .collection("Users")
//           .document(user.uid)
//           .setData(body, merge: true)
//           .then((_) => print("Success"));
//       Get.offAllNamed(Routes.ADDLOCATION);
//       prefs.setString("token", googleAuth.token);
//     } else {
//       _signInController.isLoading.value = false;
//       Get.snackbar("Error", "You're Need to try again");
//     }
//   }
// }
