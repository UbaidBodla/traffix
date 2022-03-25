import 'package:flutter/material.dart';

boxDecoration() {
  return BoxDecoration(
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
      borderRadius: BorderRadius.circular(13));
}
