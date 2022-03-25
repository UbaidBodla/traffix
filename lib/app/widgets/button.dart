import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

button(String route, String text) {
  return Center(
    child: GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Container(
        height: 42,
        width: 325,
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.openSans(fontSize: 12, color: Colors.white),
        )),
        decoration: BoxDecoration(
            color: Color(0xff221AAF), borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}
button2(Function function, String text) {
  return Center(
    child: GestureDetector(
      onTap: () => function(),
      child: Container(
        height: 42,
        width: 325,
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.openSans(fontSize: 12, color: Colors.white),
        )),
        decoration: BoxDecoration(
            color: Color(0xff221AAF), borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}
