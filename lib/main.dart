import 'package:iot_flutter_project/util/globals.dart';
import 'package:iot_flutter_project/widgets/button.dart';
import 'package:flutter/material.dart';

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
              icon: "assets/image/smart-light.png",
              color: GlobalVal.orange,
              boxColor: GlobalVal.box_orange,
              text: "Open",
              textColor: GlobalVal.orange,
            ),
            SizedBox(width: size.width * 0.01),
            ButtonWidget(
              title: "Temp",
              size: size,
              icon: "assets/image/smart-temperature.png",
              color: GlobalVal.green,
              boxColor: GlobalVal.box_green,
              text: "Close",
              textColor: GlobalVal.green,
            ),
          ],
        ),
      ),
    );
  }
}
