import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:traffix/app/modules/sign_in/provider/fb_sign_in.dart';
import 'package:traffix/app/modules/sign_in/provider/google_sign_in.dart';
import 'package:traffix/app/modules/sign_in/provider/twitter_sign_in.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/button.dart';
import 'package:traffix/app/widgets/socialcard.dart';
import 'package:traffix/app/widgets/textfields.dart';

import '../../sign_up/provider/email_sign_up.dart';
import '../provider/email_sign_in.dart';

class SignInView extends GetView<SignInController> {
  SignInController _signInController = Get.put(SignInController());

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   leading: Container(),
        //   backgroundColor: Color(0xff221AAF),
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
            child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Text("Sign in to your account",
                      style: GoogleFonts.openSans(
                          fontSize: 24, fontWeight: FontWeight.bold))),
              Image.asset("assets/illustrations/set.png"),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: input(
                      controller: email,
                      placeholder: "Email",
                      password: false)),
              Center(
                  child: input(
                      controller: password,
                      placeholder: "Password",
                      password: true)),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.FORGOT_PASSWORD);
                      },
                      child: Text("Forgot Password")),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _signInController.isLoadingEmailLogin.value
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    )
                  : button2(() {
                      _signInController.isLoadingEmailLogin.value = true;

                      if ((email.text != "") &&
                          (password.text != "") &&
                          (email.text != null) &&
                          (password.text != null)) {
                        EmailSignInProvider()
                            .loginWithEmail(email.text, password.text)
                            .then((value) {
                          _signInController.isLoadingEmailLogin.value = false;
                        });
                      } else {
                        _signInController.isLoadingEmailLogin.value = false;
                        Get.snackbar('Eror', 'Please put email & password');
                      }
                    }, "Sign In"),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "-Or Sign In With-",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        _signInController.isLoadingGoogleLogin.value = true;
                        GoogleSignInProvider()
                            .loginWithGoogle(login: false)
                            .then((value) {
                          _signInController.isLoadingGoogleLogin.value = false;
                        });
                      },
                      child: _signInController.isLoadingGoogleLogin.value ==
                              true
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                            )
                          : socialcard("google1")),
                  GestureDetector(
                      onTap: () {
                        _signInController.isLoadingFbLogin.value = true;
                        FBLoginProvider()
                            .loginWithFB(login: false)
                            .then((value) {
                          _signInController.isLoadingFbLogin.value = false;
                        });
                      },
                      child: _signInController.isLoadingFbLogin.value == true
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                            )
                          : socialcard("facebook"))
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Don't have an account yet?"),
                      GestureDetector(
                        onTap: () => Get.offAllNamed(Routes.SIGN_UP),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Color(0xff221AAF)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        )));
  }
}
