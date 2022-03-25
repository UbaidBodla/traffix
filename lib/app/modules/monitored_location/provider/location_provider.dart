import 'package:get/get.dart';
import 'package:traffix/app/data/API/Url.dart';

class LocationProvider extends GetConnect {
  Future<List> getCountries() async {
    // final pref = await SharedPreferences.getInstance();
    // String token = pref.getString("token");
    final response = await get(COUNTRYURL);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      final _res = response.body;
      List countries = [];
      for (int i = 0; i < _res.length; i++) {
        countries.add(_res[i]["name"]);
        print(_res[i]["name"]);
      }
      print(_res[0]["name"]);
      return countries;
    }
  }

  Future<List> getCities({String country}) async {
    Map body = {
      "order": "asc",
      "orderBy": "name",
      "country": country ?? "Nigeria"
    };
    // final pref = await SharedPreferences.getInstance();
    // String token = pref.getString("token");
    final response = await post(CITYURL, body);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      final _res = response.body;
      List cities = [];
      for (int i = 0; i < _res["data"].length; i++) {
        cities.add(_res["data"][i]["city"]);
        print(_res["data"][i]["city"]);
      }
      print("victorhezzzzzzzzzzzzzzzzzzzzz");
      print(_res["data"][1]["city"]);
      return cities;
    }
  }

  Future<List> getLGA({String state}) async {
    String url =
        "http://locationsng-api.herokuapp.com/api/v1/states/$state/details";
    // final pref = await SharedPreferences.getInstance();
    // String token = pref.getString("token");
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      final _res = response.body;
      List lGAs = [];
      for (int i = 0; i < _res["lgas"].length; i++) {
        lGAs.add(_res["lgas"][i]);
        print(_res["lgas"]);
      }
      print("Edwardddddd");
      print(_res[1]);
      return lGAs;
    }
  }
}
