import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_mart/Pages/HomeTabBar/Slider.dart';
import 'package:online_mart/Pages/HomeTabBar/TitlePage.dart';
import 'package:online_mart/Pages/Services/CRUD.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({Key key}) : super(key: key);

  @override
  _HomeTabBarState createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            // color: Colors.red,
            width: width,
            height: height,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    // color: Colors.blue,
                    height: 90,
                    child: TitlePage(),
                  ),
                ),
                Container(
                  color: Colors.red,
                  height: 250,
                  child: SliderPage(),
                )
              ],
            )));
  }
}
