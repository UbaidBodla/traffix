import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/modules/select_plan/controllers/select_plan_controller.dart';
import 'package:traffix/app/widgets/boxDecoration.dart';
import 'package:traffix/app/widgets/select_plan.dart';

class SelectPlanView extends GetView<SelectPlanController> {
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
                            "Select Plan",
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
                      selectPlan(
                          number: "1.", plan_name: "Daily Plan", price: "N100"),
                      selectPlan(
                          number: "2.",
                          plan_name: "1 Week Plan",
                          price: "N600"),
                      selectPlan(
                          number: "3.",
                          plan_name: "2 Weeks Plan",
                          price: "N1100"),
                      selectPlan(
                          number: "4.",
                          plan_name: "1 Month Plan",
                          price: "N2000"),
                      selectPlan(
                          number: "5.",
                          plan_name: "Yearly Plan",
                          price: "N12000"),
                    ]))));
  }
}
