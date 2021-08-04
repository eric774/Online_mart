import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HelpTabBar extends StatefulWidget {
  const HelpTabBar({Key key}) : super(key: key);

  @override
  _HelpTabBarState createState() => _HelpTabBarState();
}

class _HelpTabBarState extends State<HelpTabBar> {
  var subscription;
  var status = 'offline';
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          status = "offline";
        });
      } else {
        setState(() {
          status = "online";
        });
      }
    });
  }

  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('SliderImage').snapshots();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: users,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Somthing went Wrong");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading...");
        }
        final data = snapshot.requireData;
        return ListView(children: [
          // Container(
          //   color: status == 'offline' ? Colors.grey : Colors.green,
          //   child: Text(status),
          // ),
          status == 'offline'
              ? Container(
                  height: height,
                  width: width,
                  child: Text(
                    "Please Check the Internet",
                    style: TextStyle(fontSize: 20),
                  ))
              : Container(
                  height: 200,
                  child: CarouselSlider.builder(
                      itemCount: data.docs.length,
                      itemBuilder:
                          (BuildContext context, int index, int pageViewIndex) {
                        return Image.network(
                          data.docs[index]['img'],
                          height: 250,
                          // width: 250,
                        );
                      },
                      options: CarouselOptions(
                        // autoPlayAnimationDuration: Duration(seconds:),
                        pageSnapping: true,
                        // pauseAutoPlayInFiniteScroll: true,
                        autoPlay: true,
                        viewportFraction: 0.9,
                        aspectRatio: 2.0,
                        scrollDirection: Axis.horizontal,
                        height: 200,
                      )))
        ]);
      },
    ));
  }
}
