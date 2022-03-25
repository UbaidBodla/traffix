import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

cardDetails(String address, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(left: 8),
    child: Row(children: [
      Icon(
        icon,
        color: Color(0xff221AAF),
      ),
      Text(address,
          style: GoogleFonts.openSans(
            fontSize: 14,
          ))
    ]),
  );
}
