import 'package:chat_appilication/screens/onbording/sign_up.dart';
import 'package:chat_appilication/screens/screens/bottom_bar.dart';
import 'package:chat_appilication/ui_helper.dart';
import 'package:chat_appilication/until/custom_widets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splace_screens.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login in to Chatbox",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000e08)),
              ),
              hSpace(),
              Text(
                "Welcome back! Sign in using your social \n       account or email to continue us",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              hSpace(),
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
              hSpace(),
              InputTextFild(
                  text: "Email",
                  hintext: "Enter User Email",
                  mController: emailController,
                  mValidator: (value) {
                    if (value.isEmpty || value!.contains("@")) {
                      return "Pleace Enter Valid Email";
                    } else {
                      return null;
                    }
                  }),
              /* 
              TextFormField(
                decoration: InputDecoration(),
                validator: (value) {
                  if (value!.isEmpty) ;
                },
              ),
            */
              hSpace(),
              InputTextFild(
                text: "Password",
                hintext: "Enter User Password",
                mController: passwordController,
                //  labText: "kjfskdj",
                mValidator: (value) {
                  if (value == " " && value.isNotEmpty) {
                    return "Pleace Enter Valid Email";
                  } else {
                    return null;
                  }
                },
              ),
              hSpace(mheight: 150),
              CustomContainerButton("Log in", () async {
                //// if Succesfully user log in
                print("object");
                var sp = await SharedPreferences.getInstance();
                sp.setBool(SplashScreensState.LoginKey, true);

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => BottomBarPages()));
                // if (_formKey.currentState!.validate()) {

                // }
              }, Color(0xfff3f6f6)),
              hSpace(mheight: 40),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 20, color: Color(0xff24786d)),
                  )),
              hSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create New Account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
