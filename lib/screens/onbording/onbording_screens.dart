import 'package:chat_appilication/screens/onbording/log_in.dart';
import 'package:chat_appilication/ui_helper.dart';
import 'package:chat_appilication/until/custom_widets.dart';
import 'package:flutter/material.dart';

class OnbordingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 10.0],
            colors: [Color(0xff43116A), Color(0xff1E1E1E)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/c.png",
                      color: Colors.white,
                      scale: 20,
                    ),
                    wSpace(),
                    Text(
                      "Chatbox",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Text(
                "Connect \nfriends easily & \nquickly",
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              hSpace(),
              Text(
                  "Our chat app is the perfect way to stay connected with friends and family.",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)),
              hSpace(mheight: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SocialButton(
                      Imge: "assets/icons/Facebook_Logo.png",
                      Scale: 35,
                      border: Border.all(color: Colors.white),
                      ontapped: () {}),
                  SocialButton(
                      Imge: "assets/icons/google-icon.png",
                      Scale: 75,
                      border: Border.all(color: Colors.white),
                      ontapped: () {}),
                  SocialButton(
                      Imge: "assets/icons/apple-mac-icon.png",
                      Scale: 10,
                      border: Border.all(color: Colors.white),
                      ontapped: () {}),
                  SocialButton(
                    Imge: "assets/icons/phone.png",
                    Scale: 40,
                    ontapped: () {},
                    border: Border.all(color: Colors.white),
                  )
                ],
              ),
              hSpace(mheight: 30),
              Row(
                children: [
                  Container(
                    height: midea.size.height * 0.001,
                    width: midea.size.width * 0.38,
                    color: Colors.white,
                  ),
                  wSpace(),
                  Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  wSpace(),
                  Container(
                    height: midea.size.height * 0.001,
                    width: midea.size.width * 0.38,
                    color: Colors.white,
                  )
                ],
              ),
              hSpace(mheight: 40),
              CustomContainerButton("Sign Up with Email", () {}, Colors.white),
              hSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Existing account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogInScreen(),
                            ));
                      },
                      child: Text("Log In"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
