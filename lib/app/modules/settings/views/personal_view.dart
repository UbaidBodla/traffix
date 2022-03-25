import 'package:intl/intl.dart';

import 'dart:io';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:traffix/app/data/model/user.dart';

import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/profile_text.dart';

import '../../../widgets/profile_card.dart';

class PersonalView extends StatefulWidget {
  const PersonalView({Key key}) : super(key: key);

  @override
  State<PersonalView> createState() => _PersonalViewState();
}

class _PersonalViewState extends State<PersonalView> {
  TextEditingController Name = new TextEditingController();
  TextEditingController Phone = new TextEditingController();

  File _image;
  final picker = ImagePicker();
  String imageUrl;
  String slectgender="Male";
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  TextEditingController Email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading=true;
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
          Name.text = myuser.name;
          Email.text = myuser.email;
          Phone.text = myuser.phone;
          password.text = myuser.password;
          imageUrl = myuser.image;
          slectgender = myuser.gender;
          selectedDate = myuser.date;
          isLoading=false;
        });
      }
    });
  }

  DateTime selectedDate = DateTime.now();

  Future<Null> showPicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2500));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0), () async {
      await getUser();
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    final _storage = FirebaseStorage.instance;
    if (_image != null) {
      var snapshot = await _storage
          .ref()
          .child('Images/ProfilePicture')
          .putFile(_image)
          .onComplete;
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
        Map<String, dynamic> data = {
          "image": imageUrl,
        };
        Firestore.instance.collection('Users').document(uid).updateData(data);
      });

    }
  }

  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        uploadImageToFirebase(context);
      });
    }
  }

  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        uploadImageToFirebase(context);
      });
    }
  }

  Future removepicture(BuildContext context) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;

    setState(() {
      Map<String, dynamic> data = {
        "image": '',
      };
      Firestore.instance.collection('Users').document(uid).updateData(data);
      imageUrl = '';
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          leading: Container(),
          backgroundColor: Color(0xff221AAF),
        ),
        body: isLoading?
        Center(
          child: CircularProgressIndicator(
            color: Colors.black12,
          ),
        ):
        SingleChildScrollView(
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
                            "Update Profile",
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
                        child: SingleChildScrollView(
                          child: Container(
                            width: 326,
                            height: 420,
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
                                GestureDetector(
                                  onTap: () {
                                    print('object');
                                    showDialog(
                                        context: context,
                                        builder: (_) => SimpleDialog(
                                              title: Text('Select Options '),
                                              children: [
                                                SimpleDialogOption(
                                                  onPressed: () {
                                                    removepicture(context);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Remove Picture'),
                                                ),
                                                SimpleDialogOption(
                                                  onPressed: () {
                                                    _getFromGallery();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                      'Change From Gallery'),
                                                ),
                                                SimpleDialogOption(
                                                  onPressed: () {
                                                    _getFromCamera();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Take Picture'),
                                                ),
                                              ],
                                            ));
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(Icons.person_outline,
                                            color: Color(0xff221AAF)),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Change Profile Picture',style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print('object');
                                    showDialog(
                                        context: context,
                                        builder: (_) => SimpleDialog(
                                              title: Text('Select Gender '),
                                              children: [
                                                SimpleDialogOption(
                                                  onPressed: () {
                                                    setState(() {
                                                      slectgender = 'Male';
                                                    });

                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Male'),
                                                ),
                                                SimpleDialogOption(
                                                  onPressed: () {
                                                    setState(() {
                                                      slectgender = 'Female';
                                                    });

                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Female'),
                                                ),
                                              ],
                                            ));
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(Icons.eco_outlined,
                                            color: Color(0xff221AAF)),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        slectgender!=null && slectgender!=''?
                                        Text("$slectgender", style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),)
                                            :Text('Select Gender',style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold,)),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showPicker(context);
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(Icons.date_range_outlined,
                                            color: Color(0xff221AAF)),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        selectedDate!=null?
                                        Text(
                                            "${formatter.format(selectedDate)}",style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),)
                                        :Text('Select Date of Birth',style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomTextField(
                                    controller: Name,
                                    type: TextInputType.text,
                                    hint: 'NAME',
                                    icon: Icons.person,
                                    onText: (text) {
                                      Name.text = text;
                                      if (Platform.isAndroid) {
                                        Name.selection =
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset: Name.text.length));
                                      }
                                    }),
                                CustomTextField(
                                  controller: Phone,
                                  type: TextInputType.phone,
                                  hint: 'PHONE NUMBER',
                                  icon: Icons.phone,
                                  onText: (text) {
                                    Phone.text = text;
                                    if (Platform.isAndroid) {
                                      Phone.selection =
                                          TextSelection.fromPosition(
                                              TextPosition(
                                                  offset: Phone.text.length));
                                    }
                                  },
                                ),
                                expandedCard(
                                    "Change Sign in details",
                                    SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          CustomTextField(
                                            controller: Email,
                                            type: TextInputType.emailAddress,
                                            hint: 'EMAIL:',
                                            icon: Icons.email,
                                            onText: (text) {
                                              Email.text = text;
                                              if (Platform.isAndroid) {
                                                Email.selection =
                                                    TextSelection.fromPosition(
                                                        TextPosition(
                                                            offset: Email
                                                                .text.length));
                                              }
                                            },
                                          ),
                                          // CustomTextField(
                                          //   controller: password,
                                          //   type: TextInputType.text,
                                          //   hint: 'PASSWORD',
                                          //   icon: Icons.lock,
                                          //   onText: (text) {
                                          //     password.text = text;
                                          //     if (Platform.isAndroid) {
                                          //       password.selection =
                                          //           TextSelection.fromPosition(
                                          //               TextPosition(
                                          //                   offset: password
                                          //                       .text.length));
                                          //     }
                                          //   },
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Icons.edit,
                                    Routes.PersonalView),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            Map<String, dynamic> data = {
                              "name": Name.text,
                              "email": Email.text,
                              "Phone": Phone.text,
                              "Password": password.text,
                              "image": imageUrl,
                              "gender": slectgender,
                              "date": selectedDate,
                            };
                            final FirebaseUser user = await auth.currentUser();
                            final uid = user.uid;
                            print(uid);
                            Firestore.instance
                                .collection('Users')
                                .document(uid)
                                .updateData(data)
                                .then((value) => Get.snackbar(
                                    'Authentication', 'Profile Updated.',
                                    backgroundColor: Color(0xFF221AAF),
                                    colorText: Colors.white));

                            Get.toNamed(Routes.HOME);
                          },
                          child: Container(
                            height: 42,
                            width: 325,
                            decoration: BoxDecoration(
                              color: Color(0xff221AAF),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Center(
                              child: Text("Update",
                                  style: GoogleFonts.openSans(
                                      fontSize: 12, color: Colors.white)),
                            ),
                          ),
                        ),
                      )
                    ]))));
    ;
    ;
  }
}
