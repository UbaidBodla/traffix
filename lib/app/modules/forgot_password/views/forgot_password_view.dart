import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:traffix/app/modules/forgot_password/providers/pass_reset.dart';
import 'package:traffix/app/modules/forgot_password/views/reset.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/button.dart';
import 'package:traffix/app/widgets/textfields.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                "Enter the email that is associated with your account, so as to receive an OTP to verify and reset your password. ",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: input(
                      controller: email,
                      placeholder: "Email",
                      password: false)),
              SizedBox(
                height: 10,
              ),
              button2(() async {
                if (email.text.isEmail) {

                  await PasswordResetProvider().resetPassword(email.text);



                } else {
                  Get.snackbar('Error', 'Please type correct email');
                }
              }, "Reset Password"),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}


//ubaidbodla.000@gmail.com
