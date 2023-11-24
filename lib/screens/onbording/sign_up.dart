import 'package:chat_appilication/screens/onbording/log_in.dart';
import 'package:chat_appilication/ui_helper.dart';
import 'package:chat_appilication/until/custom_widets.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign up with Email",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000e08)),
              ),
              hSpace(),
              Text(
                "Get chatting with friends and family today by \n              signing up for our chat app!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              hSpace(),

              /// social button

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialButton(
                      Imge: "assets/icons/Facebook_Logo.png",
                      Scale: 35,
                      border: Border.all(color: Colors.black),
                      ontapped: () {}),
                  SocialButton(
                      Imge: "assets/icons/google-icon.png",
                      Scale: 75,
                      border: Border.all(color: Colors.black),
                      ontapped: () {}),
                  SocialButton(
                      Imge: "assets/icons/apple-mac-icon.png",
                      Scale: 10,
                      border: Border.all(color: Colors.black),
                      ontapped: () {}),
                ],
              ),
              hSpace(mheight: 30),

              Row(
                children: [
                  Container(
                    height: midea.size.height * 0.001,
                    width: midea.size.width * 0.38,
                    color: Colors.black,
                  ),
                  wSpace(),
                  Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  wSpace(),
                  Container(
                    height: midea.size.height * 0.001,
                    width: midea.size.width * 0.38,
                    color: Colors.black,
                  )
                ],
              ),

              // hSpace(),
              InputTextFild(
                  text: "Your Name",
                  hintext: "Enter User Name",
                  mValidator: (value) {
                    // if (value == " " && value!.contains("@")) {
                    //   return "Pleace Enter Valid Email";
                    // } else {
                    //   return null;
                    // }
                  }),
              hSpace(),
              InputTextFild(
                  text: "Your Email",
                  hintext: "Enter User Email",
                  mValidator: (value) {
                    if (value == " " && value!.contains("@")) {
                      return "Pleace Enter Valid Email";
                    } else {
                      return null;
                    }
                  }),
              hSpace(),
              InputTextFild(
                text: "Password",
                hintext: "Enter User Password",
                //  labText: "kjfskdj",
                mValidator: (value) {
                  if (value == " " && value) {
                    return "Pleace Enter Valid password";
                  } else {
                    return null;
                  }
                },
              ),
              hSpace(),
              InputTextFild(
                  text: "Confirm Password",
                  hintext: "Enter User Password",
                  mValidator: (value) {
                    if (value == " " && value!.contains("@")) {
                      return "Pleace Enter Valid Email";
                    } else {
                      return null;
                    }
                  }),
              hSpace(),
              hSpace(mheight: 100),
              CustomContainerButton("Create an account", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogInScreen(),
                    ));
              }, Color(0xfff3f6f6)),
              hSpace(mheight: 40),
            ],
          ),
        ),
      ),
    );
  }
}
