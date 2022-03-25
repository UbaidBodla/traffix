import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

recent_search(
  String title,
) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        Icon(
          Icons.new_releases,
          color: Color(0xffBDBAE7),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white)),
            Text(
              "No. 16 Government Road, Agu-Awka",
              style: GoogleFonts.openSans(fontSize: 12, color: Colors.white),
            )
          ],
        )
      ],
    ),
  );
}
