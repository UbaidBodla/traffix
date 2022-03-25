import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

input(
    {String placeholder,
    bool password,
    bool email,
    bool error,
    TextEditingController controller,
    Function additionalFunction}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
        width: 325,
        height: 42,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Color(0xff707070), blurRadius: 6)],
            // border: Border.all(color: Color(0xff707070)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextFormField(
              controller: controller,
              obscureText: password,
              validator: (value) {
                if (value.isEmpty) {
                  return "Fill the form";
                }
                additionalFunction();

                return null;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeholder,
                hintStyle: GoogleFonts.openSans(fontSize: 14),
                errorStyle:
                    GoogleFonts.openSans(fontSize: 14, color: Colors.red),
                labelStyle: GoogleFonts.openSans(fontSize: 14),
              ),
            ))),
  );
}
