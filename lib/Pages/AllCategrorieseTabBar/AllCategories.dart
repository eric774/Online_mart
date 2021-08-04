import 'package:flutter/material.dart';
import 'package:online_mart/Pages/FashionProduct/AllFashonProduct.dart';
import 'package:online_mart/Pages/GroceryProduct/GroceryProduct.dart';
import 'package:online_mart/Utils/Constrains.dart';

class AllCategroiesPage extends StatefulWidget {
  const AllCategroiesPage({Key key}) : super(key: key);

  @override
  _AllCategroiesPageState createState() => _AllCategroiesPageState();
}

class _AllCategroiesPageState extends State<AllCategroiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        inkwell(context, 'assets/images/image2.jpg', 'Grocery',
            GroceryProductPage()),
        inkwell(context, 'assets/images/image3.jpg', 'Fashion', AllFashion()),
        inkwell(context, 'assets/images/image4.png', 'Fruits&Veg', 'route'),
        inkwell(context, 'assets/images/image5.png', 'Home&Kitchen', 'route'),
      ],
    ));
  }

  InkWell inkwell(BuildContext context, String img, String title, route) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route));
        },
        child: Card(
            child: ListTile(
          title: Text(title),
          leading: Image.asset(
            img,
            height: 40,
          ),
        )));
  }
}
