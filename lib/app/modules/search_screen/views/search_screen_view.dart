import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:traffix/app/modules/search_screen/controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SearchScreenView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  