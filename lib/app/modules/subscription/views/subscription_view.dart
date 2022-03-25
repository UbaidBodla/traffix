import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/modules/subscription/controllers/subscription_controller.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/boxDecoration.dart';
import 'package:traffix/app/widgets/button.dart';
import 'package:traffix/app/widgets/profile_card.dart';


class SubscriptionView extends GetView<SubscriptionController> {
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
                            "My Subscriptions",
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
                          "Current Subscriptions",
                          Column(
                            children: [
                              expandedCardDetails(
                                  "Weekly Subscription --- N600",
                                  Icons.gamepad,
                                  "3 days",
                                  greenColor: true),
                              Text(
                                "This weekly subscription allows you to view all locations, cities and spots you choose. Additional functions such as save offline, download and share are also included.Valid for 7 days from the day of purchase.",
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          Icons.subscriptions_outlined,
                          Routes.ADDPAYMENT,),
                      SizedBox(
                        height: 20,
                      ),
                      expandedCard(
                          "Make A New Subscription",
                          Column(
                            children: [
                              expandedCardDetails("Daily Subscription --- N100",
                                  Icons.bolt, "Add"),
                              expandedCardDetails(
                                  "Weekly Subscription --- N600",
                                  Icons.bolt,
                                  "Add"),
                              expandedCardDetails(
                                  "2 Weeks Subscription --- N1100",
                                  Icons.bolt,
                                  "Add"),
                              expandedCardDetails(
                                  "Monthly Subscription --- N2000",
                                  Icons.bolt,
                                  "Add"),
                              expandedCardDetails(
                                  "Yearly Subscription --- N23000",
                                  Icons.bolt,
                                  "Add")
                            ],
                          ),
                          Icons.new_releases_outlined,
                          Routes.ADDPAYMENT),
                      expandedCard(
                          "Cancel Subscriptions",
                          Column(
                            children: [
                              expandedCardDetails(
                                  "Cancel now", Icons.logout, "Cancel"),
                            ],
                          ),
                          Icons.cancel_schedule_send_outlined,
                          Routes.SUBSCRIPTION),
                      SizedBox(
                        height: 20,
                      ),
                      button(Routes.SUBSCRIPTION, "Done")
                    ]))));
  }
}
