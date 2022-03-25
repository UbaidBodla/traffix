import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/widgets/recent_search.dart';

class SearchScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff221AAF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 38,
          ),
          Center(
              child: Container(
            width: 326,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black)),
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Color(0xff707070),
                  ),
                  hintText: "13 Aroma Street...",
                  hintStyle: GoogleFonts.openSans(
                      fontSize: 13, color: Color(0xff707070)),
                ),
              ),
            ),
          )),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "RECENT SEARCH",
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 25,
                width: 124,
                decoration: BoxDecoration(
                    color: Color(0xffBDBAE7),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.delete_outline,
                        color: Color(0xffE4E4F6),
                      ),
                      Text("Clear history",
                          style: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffE4E4F6)))
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          recent_search("Awka"),
          recent_search("Owerri"),
          recent_search("Ikeja"),
          recent_search("FCT"),
          recent_search("Asaba"),
        ],
      ),
    );
  }
}
