import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_mart/HomePage.dart';
import 'package:online_mart/Pages/Auth/AuthWithGoogle/AuthService.dart';
import 'package:online_mart/Pages/Auth/AuthWithGoogle/GoogleAuth.dart';
import 'package:online_mart/SplashScreen.dart';
import 'package:provider/provider.dart';

import 'Pages/Auth/AuthWithGoogle/LoginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplshScreen()));
}
