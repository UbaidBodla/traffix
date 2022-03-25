import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffix/app/modules/monitored_location/controllers/add_location.dart';
import 'package:traffix/app/modules/monitored_location/provider/location_provider.dart';

RxString country = "".obs;
RxString state = "".obs;
addLocationField({String title, Future function}) {
  AddLocationController _contrl = Get.put(AddLocationController());
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: 50,
      child: DropdownSearch(
        mode: Mode.BOTTOM_SHEET,
        showSearchBox: true,
        searchBoxDecoration: InputDecoration(
            hintText: "Search $title",
            hintStyle: GoogleFonts.openSans(),
            prefixIcon: Icon(Icons.search_outlined)),
        label: title,
        hint: "Select $title",
        onFind: (String filter) async {
          return function;
        },
        onChanged: (data) {
          print(data);
          country.value = data.toString();
          if (data.toString() == "Nigeria") {
            _contrl.visible.value = true;
          }
        },
      ),
    ),
  );
}

addLocationFieldCity() {
  print(country.value);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: 50,
      child: DropdownSearch(
        mode: Mode.BOTTOM_SHEET,
        showSearchBox: true,
        searchBoxDecoration: InputDecoration(
            hintText: "Search City",
            hintStyle: GoogleFonts.openSans(),
            prefixIcon: Icon(Icons.search_outlined)),
        label: "City",
        hint: "Select City",
        onFind: (String filter) async {
          return LocationProvider().getCities(country: country.value);
        },
        onChanged: (data) {
          print(data);
          state.value = data.toString();
        },
      ),
    ),
  );
}

addLocationFieldLGA() {
  print(state.value);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: 50,
      child: DropdownSearch(
        mode: Mode.BOTTOM_SHEET,
        showSearchBox: true,
        searchBoxDecoration: InputDecoration(
            hintText: "Search L.G.A",
            hintStyle: GoogleFonts.openSans(),
            prefixIcon: Icon(Icons.search_outlined)),
        label: "L.G.A",
        hint: "Select L.G.A",
        onFind: (String filter) async {
          return LocationProvider().getLGA(state: state.value);
        },
        onChanged: (data) {
          print(data);
        },
      ),
    ),
  );
}
