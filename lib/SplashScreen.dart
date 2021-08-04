import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pages/Auth/AuthWithGoogle/AuthService.dart';
import 'Utils/Constrains.dart';
import 'Widget/CustomAnimation.dart';

class SplshScreen extends StatefulWidget {
  const SplshScreen({Key key}) : super(key: key);

  @override
  _SplshScreenState createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplshScreen> {
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context, CustomPageRoute(child: AuthService().handleAuth())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightpurple2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Online Mart",
              style: TextStyle(
                  fontSize: 40, fontFamily: GoogleFonts.alice().fontFamily),
            ),
            SizedBox(
              height: 15,
            ),
            LinearProgressIndicator(
              backgroundColor: grey2,
              minHeight: 10,
              semanticsLabel: '20',
            )
          ],
        ),
      ),
    );
  }
}
