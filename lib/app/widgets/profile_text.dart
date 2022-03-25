import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key key,
    this.icon,
    this.onText,
     this.type,
    this.controller,
    this.radius,
    this.height,
    this.backgroundColor,
    this.hintText,
    this.textFormat,
    this.lable,
    this.hint,
  }) : super(key: key);

  final  type;
  final IconData icon;
  final Function onText;
  double radius;
  TextEditingController controller;
  double height;
  Color backgroundColor;
  String lable;
  String hint;
  Widget hintText;
  List<TextInputFormatter> textFormat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
          height: 50,
          child: TextFormField(
              controller: controller,
              keyboardType: type,
              inputFormatters: textFormat,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                hintStyle:
                GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold),
                  labelText: lable,

                  prefixIcon: Icon(
                    icon,
                    color: Color(0xff221AAF),
                  ),

              ),
              onChanged: (text){
                onText(text);

              }
          )
      ),
    );
  }
}