import 'package:get/get.dart';

import 'package:traffix/app/modules/search_screen/controllers/search_screen_controller.dart';

class SearchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchScreenController>(
      () => SearchScreenController(),
    );
  }
}
