import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traffix/app/modules/home/views/homeDetails.dart';
import 'package:traffix/app/widgets/card_details.dart';

Completer<GoogleMapController> _controller = Completer();

final CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);

final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414);
homeCard() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 202,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ))),
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cardDetails(
                  "10 - 15 Obafemi Road, Orata.", Icons.location_on_outlined),
              Container(
                width: 80.91,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                      )
                    ]),
                child: Center(
                  child: Row(
                    children: [
                      Icon(Icons.bookmark, size: 16, color: Color(0xff221AAF)),
                      Text(
                        "Bookmark",
                        style: GoogleFonts.openSans(
                            fontSize: 12, color: Color(0xff221AAF)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cardDetails("Owerri, Nigeria", Icons.location_city_outlined),
              Container(
                width: 49.91,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                      )
                    ]),
                child: Center(
                  child: Row(
                    children: [
                      Icon(Icons.share_outlined,
                          size: 16, color: Color(0xff221AAF)),
                      Text(
                        "Share",
                        style: GoogleFonts.openSans(
                            fontSize: 12, color: Color(0xff221AAF)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          cardDetails("Traffic Jam, Approximately 200 - 300 Vehicles.",
              Icons.countertops_outlined),
          SizedBox(
            height: 10,
          ),
          cardDetails("3 Alternative routes", Icons.edit_road_outlined),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cardDetails("7.3/10", Icons.star),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 87,
                  height: 25,
                  decoration: BoxDecoration(
                      color: Color(0xff221AAF),
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Get.to(HomeDetails(
                        address: "10 - 15 Obafemi Road, Orata.",
                        city: "Owerri, Nigeria",
                        traffic:
                            "Traffic Jam, Approximately 200 - 300 Vehicles.",
                        route: "3 Alternative routes",
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "View More",
                            style: GoogleFonts.openSans(
                                fontSize: 10, color: Colors.white),
                          ),
                          Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    ),
  );
}

Future<void> _goToTheLake() async {
  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
}
