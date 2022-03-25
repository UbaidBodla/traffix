import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traffix/app/data/model/profile_controller.dart';
import 'package:traffix/app/modules/home/controllers/home_controller.dart';
import 'package:traffix/app/modules/home/views/search.dart';
import 'package:traffix/app/modules/profile/controllers/profile_controller.dart';
import 'package:traffix/app/widgets/card_details.dart';
import 'package:traffix/app/widgets/homeCard.dart';

class HomeView extends GetView<HomeController> {
  Future<void> _getOutOfApp()  async {

  if (Platform.isIOS) {

  try {
  exit(0);
  } catch (e) {
  SystemNavigator.pop(); // for IOS, not true this, you can make comment this :)
  }

  } else {

  try {
  SystemNavigator.pop(); // sometimes it cant exit app
  } catch (e) {
  exit(0); // so i am giving crash to app ... sad :(
  }

  }
}
  Future<bool> _pop(BuildContext context){

    if(Navigator.of(context).canPop()){
Navigator.of(context).pop(false);
return Future.value(true);
    } else {
      _showExitDialog(context);
      return Future.value(false);
    }
    return Future.value(false);

    // return AlertDialog(
    //   title: Text("Do you want to exit"),
    //   actions: [
    //     FlatButton(onPressed: onPressed(){
    //
    //     },
    //         child: Text("Yes"))
    //   ],
    // )
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: (){
        _pop(context);
      },
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Color(0xff221AAF),
          leading: Image.asset("assets/images/logo.png"),
          actions: [
            GestureDetector(
                onTap: () {
                  Get.to(SearchScreen());
                },
                child: Icon(Icons.search_outlined)),
            SizedBox(
              width: 10,
            )
          ],
          title: Obx(() => Text(
                controller.title[controller.currentIndex.value],
                style: GoogleFonts.openSans(fontSize: 15),
              )),
          centerTitle: true,
        ),
        body: Obx(() => controller.children[controller.currentIndex.value]),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              selectedItemColor: Color(0xff221AAF),
              unselectedItemColor: Color(0xff707070),
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: GoogleFonts.openSans(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff707070)),
              selectedLabelStyle: GoogleFonts.openSans(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff221AAF)),
              onTap: controller.onTabTapped,
              currentIndex: controller.currentIndex.value,
              items: [
                new BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  // ignore: deprecated_member_use
                  label: 'News Feed',
                ),
                new BottomNavigationBarItem(
                  icon: Icon(Icons.location_on_outlined),
                  // ignore: deprecated_member_use
                  label: 'Spots',
                ),
                new BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_active_outlined),
                    // ignore: deprecated_member_use
                    label: 'Notifications'),
                new BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz),
                    // ignore: deprecated_member_use
                    label: 'Menu')
              ],
            )),
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Do you want to exit the app?'),
        actions: [
          FlatButton(onPressed: () async {

          await  _getOutOfApp();          }, child: Text('Yes')),
          FlatButton(onPressed: (){

Navigator.of(context).pop(false);
          }, child: Text('No'))
        ],
      );
    });
  }
}

class HomeScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return homeCard();
              })),
    );
  }
}
