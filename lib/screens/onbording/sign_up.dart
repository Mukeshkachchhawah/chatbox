import 'package:chat_appilication/screens/onbording/log_in.dart';
import 'package:chat_appilication/ui_helper.dart';
import 'package:chat_appilication/until/custom_widets.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController UserNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confpasswrodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: SingleChildScrollView(
            //  physics: NeverScrollableScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Sign up with Email",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000e08)),
                  ),
                  hSpace(),
                  const Text(
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
                      const Text(
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
                      mController: UserNameController,
                      mValidator: (value) {
                        if (value.isEmpty) {
                          return "Pleace Enter Valid Email";
                        } else {
                          return null;
                        }
                      }),
                  hSpace(),
                  InputTextFild(
                      text: "Your Email",
                      hintext: "Enter User Email",
                      mController: emailController,
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
                    mController: passwordController,
                    //  labText: "kjfskdj",
                    mValidator: (value) {
                      if (value == " " && value.length < 6) {
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
                      mController: confpasswrodController,
                      mValidator: (value) {
                        if (value == " " && value.length < 6) {
                          return "Place Enter confirm password";
                        } else {
                          return null;
                        }
                      }),
                  hSpace(),
                  hSpace(mheight: 100),
                  CustomContainerButton("Create an account", () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogInScreen(),
                          ));
                    }
                  }, const Color(0xfff3f6f6)),
                  hSpace(mheight: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
