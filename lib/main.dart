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
    final List<IconData> iconlist = [
      Icons.lightbulb,
      Icons.memory,
      Icons.animation,
      Icons.eco,
      Icons.face,
      Icons.fingerprint,
      Icons.room,
      Icons.settings,
      Icons.wifi,
      Icons.mic,
      Icons.mic_off
    ];

    final List<Color> colorList = [
      Colors.black26,
      Colors.amber.shade400,
      Colors.black26,
      Colors.amber.shade400,
      Colors.black26,
      Colors.amber.shade400,
      Colors.black26,
      Colors.amber.shade400,
      Colors.black26,
      Colors.amber.shade400,
      Colors.black26
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

  GestureDetector newWidget(Size size, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        debugPrint("Oldu");
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: size.height * 0.1,
        width: size.width * 0.07,
        decoration: BoxDecoration(
          color: Colors.white,
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
            Icon(icon, size: 40, color: color),
            Text("Açık",
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
