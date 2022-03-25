import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

paymentCardField(String placeHolder, IconData icon, String title) {
  return Container(
      width: 321,
      height: 65,
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
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(
              icon,
              color: Color(0xff221AAF),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(title,
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 30,
                  width: 200,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: placeHolder,
                        helperStyle: GoogleFonts.openSans(fontSize: 11),
                        labelStyle: GoogleFonts.openSans(fontSize: 11),
                        border: InputBorder.none),
                  ),
                )
              ],
            ),
          ],
        ),
      ));
}

paymentCardField2(String placeHolder, IconData icon, String title) {
  return Container(
      width: 149,
      height: 65,
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
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(
              icon,
              color: Color(0xff221AAF),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(title,
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 30,
                  width: 100,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: placeHolder,
                        helperStyle: GoogleFonts.openSans(fontSize: 11),
                        labelStyle: GoogleFonts.openSans(fontSize: 11),
                        border: InputBorder.none),
                  ),
                )
              ],
            ),
          ],
        ),
      ));
}
