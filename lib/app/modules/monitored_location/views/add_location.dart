import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/modules/monitored_location/controllers/add_location.dart';
import 'package:traffix/app/modules/monitored_location/provider/location_provider.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/add_location_field.dart';
import 'package:traffix/app/widgets/button.dart';

class AddLocation extends GetView<AddLocationController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(0xff221AAF),
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Color(0xff221AAF),
        ),
        body: SingleChildScrollView(
            child: Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(27),
                        topRight: Radius.circular(27))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(Icons.arrow_back)),
                          ),
                          Text(
                            "Add New Location",
                            style: GoogleFonts.openSans(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 9),
                            child: Icon(Icons.home),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                            height: 121,
                            child: Image.asset(
                                "assets/illustrations/location.png")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      addLocationField(
                          title: "Country",
                          function: LocationProvider().getCountries()),
                      addLocationFieldCity(),
                      Obx(() => Visibility(
                            visible: controller.visible.value,
                            child: addLocationFieldLGA(),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      button(Routes.SELECT_PLAN, "Add Now")
                    ]))));
  }
}
