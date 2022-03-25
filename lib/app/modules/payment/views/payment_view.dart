import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:traffix/app/modules/payment/controllers/payment_controller.dart';
import 'package:traffix/app/modules/payment/views/add_payment.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/profile_card.dart';

class PaymentView extends GetView<PaymentController> {
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
                            "Payment Methods",
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
                          child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset("assets/svg/card.svg"),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text("2216  2525   5656  7778",
                                style: GoogleFonts.openSans(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ))
                        ],
                      )),
                      GestureDetector(
                        onTap: () => Get.to(AddPayment()),
                        child: profileCard("Add New Card",
                            Icons.card_giftcard_outlined, Routes.ADDPAYMENT),
                      ),
                      profileCard("Access your Traffix Wallet",
                          Icons.wallet_giftcard_outlined, Routes.WALLET),
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
                              child: Text("Pay  Now",
                                  style: GoogleFonts.openSans(
                                      fontSize: 12, color: Colors.white)),
                            ),
                          ),
                        ),
                      )
                    ]))));
  }
}
  