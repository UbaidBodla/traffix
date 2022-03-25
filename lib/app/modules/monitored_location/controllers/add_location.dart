import 'package:get/state_manager.dart';
import 'package:traffix/app/modules/monitored_location/provider/location_provider.dart';

class AddLocationController extends GetxController with StateMixin<List> {
  @override
  void onInit() {
    LocationProvider().getCountries();
    super.onInit();
  }
 RxBool visible = false.obs;
  @override
  void onReady() {}

  @override
  void onClose() {}
}
