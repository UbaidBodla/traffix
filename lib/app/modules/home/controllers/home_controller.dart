import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traffix/app/modules/home/views/home_view.dart';
import 'package:traffix/app/modules/home/views/search.dart';
import 'package:traffix/app/modules/notification/views/notification_view.dart';
import 'package:traffix/app/modules/profile/views/profile_view.dart';
import 'package:traffix/app/modules/spot/views/spot_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxInt currentIndex = 0.obs;

  final count = 0.obs;
  void onTabTapped(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  List<String> title = ["Newsfeed", "Current Spot", "Notification", "Menu"];
  List<Widget> get children =>
      [HomeScreen(), SpotView(), NotificationView(), ProfileView()];
  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
