import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/button.dart';

class WalletView extends GetView<WalletController> {
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var months = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Color(0xff221AAF),
      ),
      backgroundColor: Color(0xff221AAF),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(27), topRight: Radius.circular(27))),
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
                        onTap: () => Get.back(), child: Icon(Icons.arrow_back)),
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
                height: 20,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff9E9E9E)
                                .withOpacity(0.3)
                                .withBlue(158)
                                .withGreen(158)
                                .withRed(158),
                            blurRadius: 27.1828,
                            offset: Offset(3, 3)),
                      ],
                      borderRadius: BorderRadius.circular(13)),
                  height: 84,
                  width: 324,
                  child: Image.asset("assets/images/pic3.png"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                    height: 128,
                    width: 331,
                    child: Sparkline(
                      data: data,
                      pointsMode: PointsMode.all,
                      pointSize: 8.0,
                      pointColor: Colors.amber,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Payment Info",
                    style: GoogleFonts.openSans(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 42,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: months.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 5, right: 10),
                        child: Container(
                          height: 42,
                          width: 56,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: index != 0
                                  ? Color(0xff221AAF).withOpacity(0.2)
                                  : Color(0xff221AAF)),
                          child: Center(
                              child: Text(months[index].toString(),
                                  style: GoogleFonts.openSans(
                                      color: Colors.white))),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 326,
                  height: 116,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff9E9E9E)
                                .withOpacity(0.3)
                                .withBlue(158)
                                .withGreen(158)
                                .withRed(158),
                            blurRadius: 27.1828,
                            offset: Offset(3, 3)),
                      ],
                      borderRadius: BorderRadius.circular(13)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Current Wallet Balance:",
                                  style: GoogleFonts.openSans()),
                              Text("N20,234.76",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 57,
                            width: 58,
                            child: Center(
                              child:
                                  Image.asset("assets/illustrations/one.png"),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wallet Credited:",
                                style: GoogleFonts.openSans(),
                              ),
                              Text("N7,676.88",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 36,
                            color: Color(0xff221AAF),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Spent on Subscriptions",
                                style: GoogleFonts.openSans(),
                              ),
                              Text("N11,565.06",
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              button(Routes.HOME, "Done")
            ],
          ),
        ),
      ),
    );
  }
}
