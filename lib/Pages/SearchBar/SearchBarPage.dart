import 'package:flutter/material.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({Key key}) : super(key: key);

  @override
  _SearchBarPageState createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  var searchBar;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            title: Text("Online-Mart"),
            centerTitle: true,
            actions: [
              IconButton(
                  splashRadius: 20,
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {}),
            ],
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: Container(
                      // color: Colors.red,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        Container(
                            height: 50,
                            width: width * 0.9,
                            // color: Colors.red,
                            child: TextField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Search Products & brands",
                                    isDense: true,
                                    border: OutlineInputBorder())))
                      ])),
                ))),
        body: Padding(padding: EdgeInsets.only()));
  }
}
