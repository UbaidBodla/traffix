import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/data/model/profile_controller.dart';
import 'package:traffix/app/data/model/user.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/profile_text.dart';
class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key key}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  bool isLoading=true;
  String imageUrl;
  void getUser()async{
    UserModel myuser;

    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
   await Firestore.instance.collection('Users').document(uid).get().then((value) {
      myuser=UserModel.fromJson(value.data);
      if (myuser!=null) {
        setState(() {

          imageUrl=myuser.image;
          Name = myuser.name;
          Email = myuser.email;
          Phone = myuser.phone;
          password = myuser.password;
          isLoading=false;
        });

      }
    });
  }

  String Email;
  String Name;
  String Phone ;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0),() async {
      await getUser();
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          leading: Container(),
          backgroundColor: Color(0xff221AAF),
        ),
        body: isLoading?Center(
          child: CircularProgressIndicator(
            color: Colors.black12,
          ),
        ):SingleChildScrollView(
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
                            "My Profile",
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
                        height: 34,
                      ),
                      Center(
                        child: Container(
                          width: 326,
                          height: 231,
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
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.person,
                                      color: Color(0xff221AAF),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Name!=null&&Name!=""?
                                    Text('$Name',style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),)
                                        :Text('Name',style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.email,
                                      color: Color(0xff221AAF),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Email!=null&&Email!=""?
                                    Text('$Email',style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),)
                                        :Text('Email',style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.phone,
                                      color: Color(0xff221AAF),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Phone!=null&&Phone!=""?
                                    Text('$Phone',style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),)
                                        :Text('Phone',style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.lock,
                                      color: Color(0xff221AAF),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    password!=null&&password!=""?
                                    Text('$password',style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),)
                                        :Text('Password',style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),

                              // CustomTextField(
                              //     controller: Name,
                              //     type: TextInputType.text,
                              //     hint: 'NAME',
                              //     icon: Icons.person,
                              //     onText: (text) {
                              //       Name.text = text;
                              //       if (Platform.isAndroid) {
                              //         Name.selection = TextSelection.fromPosition(
                              //             TextPosition(offset: Name.text.length));
                              //       }
                              //     }),
                              // CustomTextField(
                              //   controller: Email,
                              //   type: TextInputType.emailAddress,
                              //   hint: 'EMAIL:',
                              //   icon: Icons.email,
                              //   onText: (text) {
                              //     Email.text = text;
                              //     if (Platform.isAndroid) {
                              //       Email.selection = TextSelection.fromPosition(
                              //           TextPosition(offset: Email.text.length));
                              //     }
                              //   },),
                              // CustomTextField(
                              //
                              //   controller: Phone,
                              //   type: TextInputType.phone,
                              //   hint: 'PHONE NUMBER',
                              //   icon: Icons.phone,
                              //   onText: (text) {
                              //     Phone.text = text;
                              //     if (Platform.isAndroid) {
                              //       Phone.selection = TextSelection.fromPosition(
                              //           TextPosition(offset: Phone.text.length));
                              //     }
                              //   },),
                              // CustomTextField(
                              //   controller: password,
                              //   type: TextInputType.text,
                              //   hint: 'PASSWORD',
                              //   icon: Icons.lock,
                              //   onText: (text) {
                              //     password.text = text;
                              //     if (Platform.isAndroid) {
                              //       password.selection = TextSelection.fromPosition(
                              //           TextPosition(offset: password.text.length));
                              //     }
                              //
                              //   },),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      // Center(
                      //   child: GestureDetector(
                      //     onTap: () async{
                      //
                      //       Map<String, dynamic> data = {
                      //         "name": Name.text,
                      //         "email": Email.text,
                      //         "Phone": Phone.text,
                      //         "Password": password.text,
                      //       };
                      //       final FirebaseUser user = await _auth.currentUser();
                      //       final uid = user.uid;
                      //       print(uid);
                      //       Firestore.instance
                      //           .collection('Users').document(uid).
                      //       updateData(data).then((value) => Get.snackbar('Authentication', 'Profile Updated.',
                      //           backgroundColor: Color(0xFF221AAF), colorText: Colors.white));
                      //
                      //       Get.toNamed(Routes.HOME);
                      //     }
                      //
                      //
                      //     ,
                      //     child: Container(
                      //       height: 42,
                      //       width: 325,
                      //       decoration: BoxDecoration(
                      //         color: Color(0xff221AAF),
                      //         borderRadius: BorderRadius.circular(9),
                      //       ),
                      //       child: Center(
                      //         child: Text("Done",
                      //             style: GoogleFonts.openSans(
                      //                 fontSize: 12, color: Colors.white)),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ]))));;
  }
}
