import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

notification() {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
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
          borderRadius: BorderRadius.circular(13)),
      height: 129,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.notification_important,
                  color: Color(0xff221AAF),
                ),
                Text("Login Attempt Blocked",
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
                Text("12:09 PM",
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "A login attempt was made to your account from an IP ID of" +
                  "192.223.23.23.01 at a location approximate to Jos, Nigeria." +
                  "Due to it didn't complete the requisite 2FA authentication," +
                  "the attempt was blocked. If you think your account is in " +
                  "danger, please, change password in settings.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(fontSize: 12),
            ),
          )
        ],
      ),
    ),
  );
}
