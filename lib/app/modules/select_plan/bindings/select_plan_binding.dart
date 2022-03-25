import 'package:get/get.dart';

import 'package:traffix/app/modules/select_plan/controllers/select_plan_controller.dart';

class SelectPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectPlanController>(
      () => SelectPlanController(),
    );
  }
}
