import 'package:get/get.dart';

import '../../../data/model/user.dart';

class SignInController extends GetxController {
  //TODO: Implement SignInController
 UserModel currentUser;
  final isLoadingGoogleLogin = false.obs;
 final isLoadingFbLogin = false.obs;
 final isLoadingEmailLogin = false.obs;
 final isLoadingGoogleReg = false.obs;
 final isLoadingFbReg = false.obs;
 final isLoadingEmailReg = false.obs;

 initCurrentUser(UserModel user) {
    currentUser = user;
    update();
  }

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}
}


