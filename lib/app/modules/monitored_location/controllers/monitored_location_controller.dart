import 'package:get/get.dart';

class MonitoredLocationController extends GetxController {
  //TODO: Implement MonitoredLocationController

  final count = 0.obs;
 

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
