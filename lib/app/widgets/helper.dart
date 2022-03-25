import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GeneralHelper {
  // static readUser() async {
  //   String uid = FirebaseAuth.instance.currentUser!.uid;
  //   final fire = Get.find<FirebaseController>();
  //   fire.firestore.collection('User').doc(uid).get().then((value) {
  //     return value.data();
  //   }).catchError((e) {
  //     return null;
  //   });
  // }

  // static updateUser() async {
  //   String uid = FirebaseAuth.instance.currentUser!.uid;

  //   final appData = Get.find<LoginController>(tag: 'LoginController');
  //   final fire = Get.find<FirebaseController>();
  //   fire.firestore.collection('User').doc(uid).get().then((value) {
  //     UserModel myuser = UserModel.fromJson(value.data()!);

  //     appData.initCurrentUser(myuser);
  //   }).catchError((e) {
  //     return null;
  //   });
  // }

  static saveUser(Map<String, dynamic> model) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    await Firestore.instance.collection('Users').document(user.uid).setData({
      'uid': user.uid,
      'name': model['name'] ?? "",
      'email': model['email'] ?? "",
      'image': model['image'] ?? "",
      'password': model['Password'] ?? "",
    });
  }
}
