import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/button.dart';
import 'package:traffix/app/widgets/textfields.dart';

class SetPassword extends GetView {
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
                  child: Text("Set New Password",
                      style: GoogleFonts.openSans(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              Image.asset("assets/illustrations/forgot.png"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Create a new password to access your account with.",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child:  input(placeholder: "New Password:", password: true)),
              SizedBox(
                height: 10,
              ),
              button(Routes.HOME, "Set"),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
