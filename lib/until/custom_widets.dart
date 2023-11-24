import 'package:chat_appilication/ui_helper.dart';
import 'package:flutter/material.dart';

//// Social Button
class SocialButton extends StatelessWidget {
  String Imge;
  double Scale;
  VoidCallback ontapped;
  Border? border;
  SocialButton(
      {required this.Imge,
      required this.Scale,
      required this.ontapped,
      this.border});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontapped,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            border: border,
            image: DecorationImage(image: AssetImage(Imge), scale: Scale),
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}

//// Input log in and Log out TextFild

class InputTextFild extends StatelessWidget {
  String text;
  String hintext;
  // String labText;
  var mValidator;
  
  InputTextFild(
      {required this.text,
      required this.hintext,
      // required this.labText,
      this.mValidator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              color: Color(0xff24786d),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintext,
            //  labelText: 'Name *',
          ),
          onSaved: (String? value) {
            // This optional block of code can be used to run
            // code when the user saves the form.
          },
          validator: mValidator,
        ),
      ],
    );
  }
}
