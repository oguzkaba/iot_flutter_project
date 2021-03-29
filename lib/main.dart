import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MyHomePage(title: 'Home Automation Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<String> iconlist = [
      "assets/image/smart-light.png",
      "assets/image/smart-temperature.png"
    ];

    final List<Color> colorList = [
      Color.fromRGBO(255, 104, 51, 1),
      Colors.amber.shade400,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Automation"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for (var i = 0; i < iconlist.length; i++)
              newWidget(size, iconlist[i], colorList[i]),
          ],
        ),
      ),
    );
  }

  GestureDetector newWidget(Size size, String icon, Color color) {
    return GestureDetector(
      onTap: () {
        debugPrint("Oldu");
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: size.height * 0.1,
        width: size.width * 0.07,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 240, 235, 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 30,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              color: color,
            ),
            Text("",
                style: TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(255, 195, 173, 1),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
