import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traffix/app/widgets/card_details.dart';

Completer<GoogleMapController> _controller = Completer();

class HomeDetails extends GetView {
  final String address, city, traffic, route;
  HomeDetails({this.address, this.city, this.route, this.traffic});
  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff221AAF),
        leading: Image.asset("assets/images/logo.png"),
        title: Text(
          "Location",
          style: GoogleFonts.openSans(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                        height: 282,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
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
                        cardDetails(address, Icons.location_on_outlined),
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
                                Icon(Icons.bookmark,
                                    size: 16, color: Color(0xff221AAF)),
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
                        cardDetails(city, Icons.location_city_outlined),
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
                    cardDetails(traffic, Icons.countertops_outlined),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "The traffic at Bamgboshe Street is predicted by our servers and systems to be severely jammed. The vehicles heading towards Odunlami Street from it are stuck and haven't moved more than 10 inches in the last 30 minutes. The other lane of vehicles and commuters heading towards Forsyth have been only inching forward by 2 meters every 2 minutes. ",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    cardDetails(route, Icons.edit_road_outlined),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "> Through New Marina route down to Forsyth Avenue \n > Through Campos Memorial Mini Stadium down to the opening created by St. Nicholas Hospital Road. \n> Twin Roads at Massey Street and Odulami Street",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        cardDetails("7.3/10", Icons.star),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
