import 'package:flutter/material.dart';
import 'package:online_mart/Utils/Constrains.dart';

class ProfileTabBar extends StatefulWidget {
  const ProfileTabBar({Key key}) : super(key: key);

  @override
  _ProfileTabBarState createState() => _ProfileTabBarState();
}

class _ProfileTabBarState extends State<ProfileTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
              height: 150,
              // alignment: Alignment.topLeft,
              // color: dark2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  Column(
                    children: [
                      Text('Name'),
                      Text('Email'),
                      Text('Address'),
                    ],
                  ),
                  IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => DetailsPage()))
                ],
              ))
        ],
      ),
    );
  }

  Widget DetailsPage() {
    return DraggableScrollableSheet(
        initialChildSize: 0.9,
        // minChildSize: 150,
        builder: (_, controller) => Container(
              // color: Colors.grey,
              // height: 200,
              child: ListView(
                children: [
                  Container(
                      child: CircleAvatar(
                    radius: 30,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Enter Your Name"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Phone Number"),
                  )
                ],
              ),
            ));
  }
}
