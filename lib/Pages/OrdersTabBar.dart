import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrdersTabBar extends StatefulWidget {
  const OrdersTabBar({Key key, this.documentId}) : super(key: key);
  final String documentId;

  @override
  _OrdersTabBarState createState() => _OrdersTabBarState();
}

class _OrdersTabBarState extends State<OrdersTabBar> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('Shoes').snapshots();

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
        return ListView.builder(
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(data.docs[index]['brand']),
                  leading: Image.network(data.docs[index]['img']));
            });
      },
    ));
  }
}
