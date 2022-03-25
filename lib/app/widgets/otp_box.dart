import 'package:flutter/material.dart';

oTPBox() {
  return Container(
      width: 41,
      height: 41,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0xff707070),
                blurRadius: 6,
                offset: Offset(3.0, 6.0))
          ],
          // border: Border.all(color: Color(0xff707070)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 20),
          child: TextFormField(
            keyboardType: TextInputType.number,
            maxLength: 1,
            maxLines: 1,
            decoration: InputDecoration(
              counter: SizedBox.shrink(),
              border: InputBorder.none,
            ),
          ),
        ),
      ));
}
