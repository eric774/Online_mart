import 'package:flutter/material.dart';

// class SliderDetailsPage extends StatefulWidget {
//   // const SliderDetailsPage({Key key, this.img}) : super(key: key);
//   final String img;
//   SliderDetailsPage(this.img);

//   @override
//   _SliderDetailsPageState createState() => _SliderDetailsPageState();
// }

// class _SliderDetailsPageState extends State<SliderDetailsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Online-Mart"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.only(),
//         child: Image.network(img),
//       ),
//     );
//   }
// }

class ImageScreen extends StatefulWidget {
  final String url;
  ImageScreen(this.url);

  @override
  _MyImageScreen createState() => _MyImageScreen(url);
}

class _MyImageScreen extends State<ImageScreen> {
  final String url;
  _MyImageScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Online Mart'),
        ),
        body: Image.network(url, width: double.infinity));
  }
}
