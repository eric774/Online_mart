import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_mart/Pages/FashionProduct/GirlsProduct.dart';
import 'package:online_mart/Pages/FashionProduct/KidsProduct.dart';
import 'package:online_mart/Pages/FashionProduct/MensProduct.dart';
import 'package:online_mart/Utils/Constrains.dart';

class AllFashion extends StatefulWidget {
  const AllFashion({Key key}) : super(key: key);

  @override
  _AllFashionState createState() => _AllFashionState();
}

class _AllFashionState extends State<AllFashion> with TickerProviderStateMixin {
  bool selected = false;

  TabController tb;

  void initState() {
    tb = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
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
          body: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              TabBar(
                controller: tb,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.green,
                ),
                unselectedLabelColor: Colors.black38,
                tabs: [
                  Tab(
                      child: Container(
                    // height: height,
                    width: width * 0.9,
                    decoration: BoxDecoration(),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Mens',
                          style: GoogleFonts.raleway(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                  )),
                  Tab(
                      child: Container(
                    //height: height,
                    width: width * 0.9,
                    decoration: BoxDecoration(),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Girls',
                          style: GoogleFonts.raleway(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                  )),
                  Tab(
                      child: Container(
                    //height: height,
                    // width: width * 0.9,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(50),
                        //border: Border.all(color: Colors.white),
                        ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Kids',
                          style: GoogleFonts.raleway(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                  )),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: width,
                  height: height,
                  color: Colors.red,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: tb,
                    children: [MensProduct(), GirlsProduct(), KidsProdcut()],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
