import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/routes/app_pages.dart';
import 'package:traffix/app/widgets/boxDecoration.dart';

selectPlan({String number, String plan_name, String price}) {
  return GestureDetector(
    onTap: () => Get.toNamed(Routes.PAYMENT),
    child: Container(
      height: 78,
      decoration: boxDecoration(),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              number,
              style: GoogleFonts.openSans(),
            ),
            Text(
              "$plan_name--------- $price",
              style: GoogleFonts.openSans(),
            ),
            Container(
              width: 69,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff221AAF),
                  border: Border.all(color: Colors.green, width: 1)),
              child: Center(
                child: Text("Select Plan",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        color: Colors.white, fontSize: 14)),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
