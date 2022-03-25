import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/modules/forgot_password/views/setPassword.dart';
import 'package:traffix/app/routes/app_pages.dart';

import 'package:traffix/app/widgets/button.dart';
import 'package:traffix/app/widgets/otp_box.dart';

class ResetOTP extends GetView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Color(0xff221AAF),
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Text("Forgot Password?",
                      style: GoogleFonts.openSans(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              Image.asset("assets/illustrations/forgot.png"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter the OTP sent to your email address.",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  oTPBox(),
                  oTPBox(),
                  oTPBox(),
                  oTPBox(),
                  oTPBox(),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              button(Routes.SETPASSWORD, "Next"),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
