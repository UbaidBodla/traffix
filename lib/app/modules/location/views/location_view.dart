import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:traffix/app/modules/location/controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LocationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LocationView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  