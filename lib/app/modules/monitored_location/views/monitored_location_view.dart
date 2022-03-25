import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/modules/monitored_location/controllers/monitored_location_controller.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/button.dart';
import 'package:traffix/app/widgets/profile_card.dart';

class MonitoredLocationView extends GetView<MonitoredLocationController> {
  @override
  Widget build(BuildContext context) {
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
                            "Active Locations",
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
                                "assets/illustrations/addpayment.png")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      expandedCard(
                          "Onitsha North L.G.A",
                          Column(
                            children: [
                              expandedCardDetails(
                                  "Anambra State", Icons.gamepad, "active",
                                  greenColor: true),
                              Text(
                                "Onitsha North is located at the lowest axis in Anambra State cardinal, with over 50000 populants",
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          Icons.location_city_outlined,
                          Routes.ADDPAYMENT),
                      SizedBox(
                        height: 20,
                      ),
                      expandedCard(
                          "Ikeja L.G.A",
                          Column(
                            children: [
                              expandedCardDetails(
                                  "Lagos State", Icons.gamepad, "active",
                                  greenColor: true),
                              Text(
                                "Ikeja seems to be the highest state L.G.A in Lagos with highest populants",
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          Icons.location_city_outlined,
                          Routes.ADDPAYMENT),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      button(Routes.ADDLOCATION, "Add location")
                    ]))));
  }
}
