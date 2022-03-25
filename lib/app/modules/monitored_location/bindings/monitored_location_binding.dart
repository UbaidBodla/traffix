import 'package:get/get.dart';
import 'package:traffix/app/modules/monitored_location/controllers/add_location.dart';

import 'package:traffix/app/modules/monitored_location/controllers/monitored_location_controller.dart';

class MonitoredLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoredLocationController>(
      () => MonitoredLocationController(),
    );
     Get.lazyPut<AddLocationController>(
      () => AddLocationController(),
    );
  }
}
