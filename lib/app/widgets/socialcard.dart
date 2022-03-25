import 'package:flutter/material.dart';

socialcard(String image) {
  return Container(
    width: 57,
    height: 51,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0xff707070), blurRadius: 6, offset: Offset(3.0, 6.0))
        ],
        // border: Border.all(color: Color(0xff707070)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)),
    child: Image.asset(
      "assets/images/$image.png",
      height: 32,
      width: 32,
    ),
  );
}
