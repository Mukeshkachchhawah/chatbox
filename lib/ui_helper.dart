import 'package:flutter/material.dart';

Widget hSpace({double mheight = 15.0}) {
  return SizedBox(
    height: mheight,
  );
}

Widget wSpace({double mwidth = 11.0}) {
  return SizedBox(
    width: mwidth,
  );
}

Widget CustomContainerButton(
    String text, VoidCallback ontapped, Color? bgColor) {
  return InkWell(
    onTap: ontapped,
    child: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}

Widget CustomTextFild(
    mController, String hinttext, String lebtext, IconButton? sufIcon) {
  return SizedBox(
    width: 270,
    child: TextFormField(
      controller: mController,
      decoration: InputDecoration(
          hintText: hinttext, labelText: lebtext, suffixIcon: sufIcon
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
          ),
    ),
  );
}
