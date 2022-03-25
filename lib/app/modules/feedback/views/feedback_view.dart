import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/modules/feedback/controllers/feedback_controller.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/button.dart';

class FeedbackView extends GetView<FeedbackController> {
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
                        topLeft: Radius.circular(27),
                        topRight: Radius.circular(27))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
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
                            "Send Quick Feedback",
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
                          height: 100,
                          width: 324,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset("assets/images/pic3.png"),
                              Text("Chioma Sopuru")
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
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
                            height: 300,
                            width: 324,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                maxLines: 50,
                                decoration: InputDecoration(
                                    hintMaxLines: 20,
                                    border: InputBorder.none,
                                    labelStyle:
                                        GoogleFonts.openSans(fontSize: 15),
                                    hintStyle:
                                        GoogleFonts.openSans(fontSize: 15),
                                    hintText:
                                        "Enter your message for immediate response"),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      button(Routes.HOME, "Send")
                    ]))));
  }
}
