import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_mart/Pages/AllCategrorieseTabBar/AllCategories.dart';

class TitlePage extends StatefulWidget {
  const TitlePage({Key key}) : super(key: key);

  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('HomePageIcon').snapshots();

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
        return ListView(
          scrollDirection: Axis.horizontal,
          children: [
            inkwell(context, 'assets/images/image1.png', 'Categories',
                AllCategroiesPage()),
            inkwell(context, 'assets/images/image2.jpg', 'Grocery', 'route'),
            inkwell(context, 'assets/images/image3.jpg', 'Fashion', 'route'),
            inkwell(context, 'assets/images/image4.png', 'Fruits&Veg', 'route'),
            inkwell(
                context, 'assets/images/image5.png', 'Home&Kitchen', 'route'),
          ],
        );
      },
    ));
  }

  InkWell inkwell(BuildContext context, String img, String title, route) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route));
        },
        child: Container(
            // height: 40,
            margin: EdgeInsets.only(left: 5),
            width: 75,
            // color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(radius: 20, backgroundImage: AssetImage(img)),
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 11),
                )
              ],
            )));
  }
}
