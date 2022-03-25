import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/modules/profile/controllers/profile_controller.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/profile_card.dart';
import 'package:traffix/app/widgets/profile_tag.dart';

import '../../../data/model/user.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
                height: 40,
              ),
              profileCard(
                  "My Profile", Icons.person_outlined, Routes.PROFILEDETAILS),
              profileCard(
                  "My Payments", Icons.account_balance_wallet, Routes.PAYMENT),
              profileCard(
                  "My Subscriptions", Icons.star_outline, Routes.SUBSCRIPTION),
              profileCard(
                  "Customer Service", Icons.message_outlined, Routes.FEEDBACK),
              profileCard("Monitored locations", Icons.location_on_outlined,
                  Routes.MONITORED_LOCATION),
              profileCard("Settings", Icons.settings, Routes.SETTINGS),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  profileTag("Logout", Icons.login_outlined, Color(0xffE95656),
                      Routes.SIGN_IN),
                  profileTag("Get More Apps", Icons.android_outlined,
                      Color(0xff221AAF), Routes.HOME),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



