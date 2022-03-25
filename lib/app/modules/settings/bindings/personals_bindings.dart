

import 'package:get/get.dart';

import 'package:traffix/app/modules/settings/controllers/personals_controller.dart';

class PersonalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalsController>(
          () => PersonalsController(),
    );
  }
}