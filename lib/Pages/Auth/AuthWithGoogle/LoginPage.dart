import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_mart/HomePage.dart';
import 'package:online_mart/Pages/Auth/AuthWithGoogle/GoogleAuth.dart';
import 'package:online_mart/Pages/Auth/AuthWithPhone/PhoneAuth.dart';
import 'package:online_mart/Utils/Constrains.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'authService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String email, password;

  Color greenColor = Color(0xFF00AF19);

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //To Validate email

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: ListView(children: [
              SizedBox(height: 75.0),
              Container(
                  // height: 125.0,
                  // width: 200.0,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shimmer.fromColors(
                  //     baseColor: Colors.cyan,
                  //     highlightColor: Colors.blueAccent,
                  //     child: Text('Hello There',
                  //         style: TextStyle(
                  //             fontFamily: GoogleFonts.aBeeZee().fontFamily,
                  //             fontSize: 40.0))),
                  Shimmer.fromColors(
                      baseColor: Colors.cyan,
                      highlightColor: Colors.blueAccent,
                      child: Text("Welcome To Online-Mart",
                          style: TextStyle(
                              fontFamily: GoogleFonts.alegreya().fontFamily,
                              fontSize: 50.0)))
                ],
              )),
              SizedBox(height: 20),
              Container(
                  height: 50,
                  color: Colors.deepPurple,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhoneAuth()));
                      },
                      child: Text(
                        "Sign Up With Number",
                        style: TextStyle(fontSize: 16),
                      ))),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  onPrimary: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                ),
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
                label: Text(
                  "Sign Up with Google",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLoginIn();
                },
              ),
              SizedBox(height: 20),
              Material(
                  child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100,
                          height: 40,
                          alignment: Alignment.center,
                          color: Colors.green,
                          child: Text(
                            "Skip",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      )))
            ])));
  }
}
