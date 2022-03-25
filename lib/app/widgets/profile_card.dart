import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

profileCard(String text, IconData icon, String route, {bool required}) {
  return GestureDetector(
    onTap: () => Get.toNamed(route),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
            width: 321,
            height: 50,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    icon,
                    color: Color(0xff221AAF),
                  ),
                  Text(text,
                      style: GoogleFonts.openSans(
                          fontSize: 12, color: Colors.black)),
                  Center(
                    child: Container(
                      width: 46,
                      height: 24,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    ),
  );
}

expandedCard(String title, Widget body, IconData icon, String route,
    {Widget collapse}) {
  return GestureDetector(
    onTap: () => Get.toNamed(route),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
            width: 321,
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
              child: ExpandablePanel(
                builder: (_, collapsed, expanded) {
                  return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ));
                },
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      icon,
                      color: Color(0xff221AAF),
                    ),
                    Text(title),
                    Container()
                  ],
                ),
                collapsed: collapse,
                expanded: body,
              ),
            )),
      ),
    ),
  );
}

expandedCardDetails(String text, IconData icon, String subText,
    {bool greenColor = true}) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Icon(
      icon,
      color:
          greenColor ? Color(0xff18C953) : Color(0xff221AAF).withOpacity(0.4),
    ),
    Text(text,
        style: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        )),
    GestureDetector(
      child: Container(
          width: 28,
          height: 17,
          decoration: BoxDecoration(
              border:
                  Border.all(color: Color(0xff221AAF).withOpacity(0.2), width: 1),
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(subText,
                  style:
                      GoogleFonts.openSans(fontSize: 8, color: Color(0xff18C953)))
            ],
          )),
    )
  ]);
}
