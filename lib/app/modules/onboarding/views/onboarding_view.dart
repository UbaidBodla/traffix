import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:traffix/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/button.dart';

class OnboardingView extends GetView<OnboardingController> {
  

  var _key;
  final introKey = GlobalKey<IntroductionScreenState>();
  static const bodyStyle = TextStyle(fontSize: 10.0);
  static const pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    bodyTextStyle: bodyStyle,
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );
  Widget _buildImage(String assetName) {
    return Align(
      child:
          Image.asset('assets/illustrations/$assetName.png', width: Get.width),
      alignment: Alignment.bottomCenter,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        // appBar: AppBar(
        //   backgroundColor: Color(0xff221AAF),
        //   elevation: 0,
        // ),
        body: Container(
            height: Get.height,
            width: Get.width,
            child: IntroductionScreen(
                key: introKey,
                pages: [
                  PageViewModel(
                    title:
                        "Do you want to skip heavy traffic and avoid go-slow? ",
                    body:
                        "Our tools help you to track what the current road traffic situation is in your selected roads, spots and help you navigate the best way past it to your choice destination. ",
                    image: _buildImage("one"),
                    decoration: pageDecoration,
                  ),
                  PageViewModel(
                    title:
                        "Get to your destinations and appointments faster and better!",
                    body:
                        "Using traffix helps you beat the delays and inconveniences posed by traffic congestion and seamlessly get to your appointments faster and better.",
                    image: _buildImage("two"),
                    decoration: pageDecoration,
                  ),
                  PageViewModel(
                    title:
                        "Do away with excuses of lateness and the embarrassment it brings.",
                    body:
                        "Excuses as to lateness, as a result of traffic congestions poses the biggest challenges to corporates, business men and organisations. Traffix helps its users put an end to it effectively.",
                    image: _buildImage("three"),
                    footer: button(Routes.SIGN_IN, "Get Started"),
                    decoration: pageDecoration,
                  ),
                  
      ],
                onDone: () => Get.offAllNamed(Routes.SIGN_IN),
                //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
                showSkipButton: true,
                skipFlex: 0,
                nextFlex: 0,
                skip: const Text('Skip'),
                next: const Icon(Icons.arrow_forward),
                done: const Text('Done',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                dotsDecorator: const DotsDecorator(
                  size: Size(10.0, 10.0),
                  color: Color(0xFFBDBDBD),
                  activeSize: Size(22.0, 10.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
               ))));
  }
}
