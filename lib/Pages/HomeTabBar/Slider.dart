import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_mart/Pages/HomeTabBar/SliderImageScreen.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  CarouselController buttonCarouselController = CarouselController();
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('SliderImage').snapshots();

  @override
  Widget build(BuildContext context) {
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
        return CarouselSlider.builder(
            itemCount: data.docs.length,
            carouselController: buttonCarouselController,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return GestureDetector(
                  child: Image.network(data.docs[index]['img']),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ImageScreen(data.docs[index]['img'])));
                  });
            },
            options: CarouselOptions(
              // autoPlayAnimationDuration: Duration(seconds: 2),
              pageSnapping: true,
              pauseAutoPlayInFiniteScroll: true,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              // pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.easeInSine,
              height: 250,
            ));
      },
    ));
  }
}
