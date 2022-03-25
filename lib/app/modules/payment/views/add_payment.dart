import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/modules/payment/controllers/payment_controller.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/cardField.dart';

class AddPayment extends GetView {
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
                            "Add Payment Info",
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add Credit Card",
                                style: GoogleFonts.openSans(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                              "Please enter your credit or debit alert information, most notably the card number, cvv and expiry date to enable us securely add your billing information.",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.openSans(fontSize: 12),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: paymentCardField("Edward Victorhez",
                                  Icons.person_outline, "CARD HOLDER NAME"),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Center(
                              child: paymentCardField("2216  2525   5656  7778",
                                  Icons.credit_card_outlined, "CARD NUMBER"),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                paymentCardField2("08/26", Icons.calendar_today,
                                    "EXPIRY DATE"),
                                paymentCardField2(
                                    "333", Icons.credit_card_outlined, "CVV"),
                              ],
                            )),
                            SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () => Get.toNamed(Routes.HOME),
                                child: Container(
                                  height: 42,
                                  width: 325,
                                  decoration: BoxDecoration(
                                    color: Color(0xff221AAF),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Center(
                                    child: Text("Done",
                                        style: GoogleFonts.openSans(
                                            fontSize: 12, color: Colors.white)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ]))));
  }
}
