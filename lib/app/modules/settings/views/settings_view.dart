import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; 

import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/button.dart';
import 'package:traffix/app/widgets/profile_card.dart';

import '../../../data/model/user.dart';


class SettingsView extends StatefulWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  String imageUrl;
  final FirebaseAuth auth = FirebaseAuth.instance;
  void getUser() async {
    UserModel myuser;

    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    await Firestore.instance
        .collection('Users')
        .document(uid)
        .get()
        .then((value) {
      myuser = UserModel.fromJson(value.data);
      if (myuser != null) {
        setState(() {
          imageUrl = myuser.image;

        });
      }
    });
  }
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0), () async {
      await getUser();
    });
  }
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
                child: Column(children: [
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
                        "My Settings",
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: imageUrl != null && imageUrl != ""
                          ? CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl),
                        maxRadius: 60,
                      )
                          : Image.asset('assets/images/emptyprofileimage.jpeg',fit: BoxFit.fill,height: 90,width: 90,),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  expandedCard(
                      "Change Personal Details",
                      Column(
                        children: [
                          expandedCardDetails(
                            "Change Profile Picture",
                            Icons.person_outline,
                            "Select",
                          ),
                          expandedCardDetails(
                            "Change Gender",
                            Icons.eco_outlined,
                            "Select",
                          ),
                          expandedCardDetails(
                            "Change Date of Birth",
                            Icons.date_range_outlined,
                            "Select",
                          ),
                          expandedCardDetails(
                            "Change Sign in details",
                            Icons.login_outlined,
                            "Select",
                          ),
                        ],
                      ),
                      Icons.edit,
                      Routes.PersonalView),
                  expandedCard(
                      "2FA/Security settings",
                      Column(
                        children: [
                          expandedCardDetails(
                              "Verify Email", Icons.email_outlined, "Select",
                              greenColor: false),
                          expandedCardDetails("Verify Phone Number ",
                              Icons.call_outlined, "Select",
                              greenColor: false),
                          expandedCardDetails("Add Access PIN",
                              Icons.vpn_key_outlined, "Select",
                              greenColor: false),
                          expandedCardDetails("Add Recovery Codes",
                              Icons.code_outlined, "Select",
                              greenColor: false),
                        ],
                      ),
                      Icons.security,
                      Routes.ADDPAYMENT),
                  expandedCard(
                      "Referral",
                      Column(
                        children: [
                          expandedCardDetails(
                              "Ekene Emeka", Icons.person_outlined, "veried"),
                          expandedCardDetails(
                              "John Mmezi", Icons.person_outlined, "veried"),
                        ],
                      ),
                      Icons.link_outlined,
                      Routes.SUBSCRIPTION),
                  expandedCard(
                      "Preferences",
                      Column(
                        children: [
                          expandedCardDetails("Something Here",
                              Icons.location_on_outlined, "Here"),
                        ],
                      ),
                      Icons.preview_outlined,
                      Routes.SUBSCRIPTION),
                  expandedCard(
                      "Legal Policies",
                      Column(
                        children: [
                          expandedCardDetails("Something Here",
                              Icons.location_on_outlined, "Here"),
                        ],
                      ),
                      Icons.leaderboard_outlined,
                      Routes.SUBSCRIPTION),
                  expandedCard(
                      "About Us",
                      Column(
                        children: [
                          expandedCardDetails("Peax Tech. Inc.",
                              Icons.location_city_outlined, "Website"),
                          Text(
                            "Peax Tech is a billion-dollar tech company located in Paris, aimed at providing solutions to real life problems. Read more",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Icons.people_outline,
                      Routes.SUBSCRIPTION),
                  SizedBox(
                    height: 20,
                  ),
                  button(Routes.SUBSCRIPTION, "Done")
                ]))));
  }
}




  