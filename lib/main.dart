import 'package:iot_flutter_project/util/globals.dart';
import 'package:iot_flutter_project/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:iot_flutter_project/widgets/gauge.dart';

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Automation"),
        centerTitle: true,
        backgroundColor: GlobalVal.appbar_back,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ButtonWidget(
              title: "Light",
              size: size,
              icon: GlobalVal.light,
              color: GlobalVal.disabled,
              boxColor: GlobalVal.box_disabled,
              text: "On",
              textColor: GlobalVal.disabled,
            ),
            SizedBox(width: size.width * 0.01),
            ButtonWidget(
              title: "Cooler",
              size: size,
              icon: GlobalVal.cooler,
              color: GlobalVal.green,
              boxColor: GlobalVal.box_green,
              text: "Close",
              textColor: GlobalVal.green,
            ),
            ButtonWidget(
              title: "Door",
              size: size,
              icon: GlobalVal.door,
              color: GlobalVal.blue,
              boxColor: GlobalVal.box_blue,
              text: "Close",
              textColor: GlobalVal.blue,
            ),
            GaugeWidget(size: size),
          ],
        ),
      ),
    );
  }
}
