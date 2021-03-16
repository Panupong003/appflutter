import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';

class Showgrod extends StatefulWidget {
  @override
  _ShowgrodState createState() => _ShowgrodState();
}

class _ShowgrodState extends State<Showgrod> {
  String soil =
      'https://thingspeak.com/channels/1082376/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line';
  // String water =
  //     'https://thingspeak.com/channels/1082376/charts/3?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line';
  // String fil =
  //     'https://thingspeak.com/channels/1082376/charts/2?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15';
  WebController webController;

  void onWebCreatedGrodsoil(webController) {
    this.webController = webController;
    this.webController.loadUrl(soil);
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('           My Show Data App'),
  //     ),
  //     body: Center(
  //       child: SingleChildScrollView(
  //         child: Column(
  //           children: <Widget>[
  //             grod(context),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    FlutterNativeWeb flutterNativeWebsoil = new FlutterNativeWeb(
      onWebCreated: onWebCreatedGrodsoil,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );
    return Column(
      children: [
        Text(
          'Soil MoistureSoil',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20.0, right: 10.0, left: 5.0),
          child: flutterNativeWebsoil,
          height: 300.0,
          width: 300.0,
        )
      ],
    );
  }
}
