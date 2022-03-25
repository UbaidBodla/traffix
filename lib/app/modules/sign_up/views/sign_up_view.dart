import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/data/API/api_service.dart';
import 'package:traffix/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:traffix/app/modules/sign_in/provider/google_sign_in.dart';
import 'package:traffix/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:traffix/app/modules/sign_up/provider/email_sign_up.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/button.dart';
import 'package:traffix/app/widgets/socialcard.dart';
import 'package:traffix/app/widgets/textfields.dart';

import '../../sign_in/provider/fb_sign_in.dart';
import '../../sign_in/provider/twitter_sign_in.dart';

class SignUpView extends GetView<SignUpController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SignInController _signInController = Get.put(SignInController());
  TextEditingController fullName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirm_Password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text("Sign up for an account.",
                        style: GoogleFonts.openSans(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                Image.asset("assets/illustrations/two.png"),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: input(
                        placeholder: "Full name",
                        password: false,
                        controller: fullName)),
                Center(
                    child: input(
                        placeholder: "Email",
                        password: false,
                        controller: email)),
                Center(
                    child: input(
                        placeholder: "Password",
                        password: true,
                        controller: password)),
                Center(
                    child: input(
                        placeholder: "Re-Enter Password",
                        password: true,
                        controller: confirm_Password,
                        additionalFunction: () {
                          if (confirm_Password.text != password.text) {
                            return "Password must be the same";
                          }
                        })),
                SizedBox(
                  height: 20,
                ),
                _signInController.isLoadingEmailReg.value == true
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      )
                    : button2(() {
                        _signInController.isLoadingEmailReg.value = true;

                        if ((fullName.text != null) &&
                            (fullName.text != "") &&
                            (email.text.isEmail) &&
                            (email.text != "") &&(email.text != null)&&
                            (password.text != null) &&
                            (password.text != "")) {
                          EmailSignUpProvider()
                              .registerWithEmail(
                                  fullName.text, email.text, password.text)
                              .then((value) {
                            _signInController.isLoadingEmailReg.value = false;
                          });
                        } else {
                          if(email.text!=email.text.isEmail){
                            Get.snackbar('Error', 'Email format is not correct');

                          }
                          else
                            {
                              Get.snackbar('Error', 'Some fileds is empty');
                            }
                          _signInController.isLoadingEmailReg.value = false;
                          // Get.snackbar('Error', 'Some fields are missing');
                        }

                        // }
                      }, "Sign Up"),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "-Or Sign Up With-",
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
                          _signInController.isLoadingGoogleReg.value = true;

                          GoogleSignInProvider()
                              .loginWithGoogle(login: false)
                              .then((value) {
                            _signInController.isLoadingGoogleReg.value = false;
                          });
                        },
                        child: _signInController.isLoadingGoogleReg.value ==
                                true
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.blue),
                              )
                            : socialcard("google1")),
                    GestureDetector(
                        onTap: () {
                          _signInController.isLoadingFbReg.value = true;
                          FBLoginProvider()
                              .loginWithFB(login: false)
                              .then((value) {
                            _signInController.isLoadingFbReg.value = false;
                          });
                        },
                        child: _signInController.isLoadingFbReg.value == true
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.blue),
                              )
                            : socialcard("facebook")),
                    // GestureDetector(
                    //     onTap: () {
                    //       // controller.isLoading.value = true;
                    //       // TwitterLoginProvider()
                    //       //     .loginWithTwitter(login: false);
                    //     },
                    //     child: _signInController.isLoading.value == true
                    //         ? CircularProgressIndicator(
                    //             valueColor: AlwaysStoppedAnimation<Color>(
                    //                 Colors.blue),
                    //           )
                    //         : socialcard("twitter")),
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
                        Text("Already have an account? "),
                        GestureDetector(
                          onTap: () => Get.offAllNamed(Routes.SIGN_IN),
                          child: Text(
                            "Sign In",
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
          ),
        )));
  }
}
