import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

profileTag(String text, IconData icon, Color color, String route) {
  return GestureDetector(
    onTap: () => Get.offAllNamed(route),
    child: Container(
      width: 150,
      height: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(13), boxShadow: [
        BoxShadow(
          blurRadius: 10,
          offset: Offset(3, 3),
          color: Colors.grey[300].withAlpha(50),
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            text,
            style: GoogleFonts.openSans(fontSize: 12),
          )
        ],
      ),
    ),
  );
}
