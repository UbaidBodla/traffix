import 'package:get/get.dart';

import 'package:traffix/app/modules/spot/controllers/spot_controller.dart';

class SpotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpotController>(
      () => SpotController(),
    );
  }
}
