import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroceryProductPage extends StatefulWidget {
  const GroceryProductPage({Key key}) : super(key: key);

  @override
  _GroceryProductPageState createState() => _GroceryProductPageState();
}

class _GroceryProductPageState extends State<GroceryProductPage> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('Grocery').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Online-Mart"),
          actions: [
            IconButton(
                splashRadius: 20,
                icon: Icon(Icons.notifications),
                onPressed: () {}),
            IconButton(
                splashRadius: 20,
                icon: Icon(Icons.shopping_cart),
                onPressed: () {}),
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: users,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Somthing went Wrong");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading...");
            }
            final data = snapshot.requireData;
            return InkWell(
                child: ListView.builder(
              itemCount: data.docs.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            data.docs[index]['img'],
                            height: 100,
                            width: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.docs[index]['title'],
                                style: TextStyle(fontSize: 18),
                              ),
                              Row(children: [
                                Image.network(
                                  data.docs[index]['img1'],
                                  height: 20,
                                  width: 20,
                                ),
                                Text(data.docs[index]['price'])
                              ]),
                              Container(
                                margin: EdgeInsets.only(left: 180, top: 30),
                                color: Colors.yellow,
                                child: Text("Add"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ));
          },
        ));
  }
}
