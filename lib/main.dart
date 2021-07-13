import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iot_flutter_project/util/globals.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // await GetStorage.init();
  runApp(MyApp());
}

//GetStorage Path:/data/data/com.example.onesystem/app_flutter/GetStorage.gs
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _fbase = Firebase.initializeApp();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.native,
        home: FutureBuilder(
            future: _fbase,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Text('Data bulunamadı...');
              }
              if (snapshot.hasError) {
                return Center(child: Text('Beklenmeyen bir hata oluştu...'));
              } else if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })

        //getPages: MyNavigator.route,
        //initialRoute: SharedPrefController().getShared(),
        //theme: Themes().lightTheme,
        //darkTheme: Themes().darkTheme,
        //themeMode: ThemeController().getThemeMode(),
        );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

FirebaseFirestore fstore = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>> coll = fstore.collection('persons');
double value;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    gaugeData();
    super.initState();
  }

  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Automation"),
        centerTitle: true,
        backgroundColor: GlobalVal.appbar_back,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: coll.snapshots(),
        builder: (context, aSnapshots) {
          if (aSnapshots.hasError) {
            return Center(child: Text('Bir hata oluştu...'));
          } else if (aSnapshots.hasData) {
            return ListView.builder(
                itemCount: aSnapshots.data.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.folder),
                    trailing: Text(
                        aSnapshots.data.docs[index].data()['age'].toString()),
                    title: Text(aSnapshots.data.docs[index].data()['name']),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: <Widget>[
      //     ButtonWidget(
      //       tapFunc: () {
      //         print('object');
      //       },
      //       title: "Light",
      //       size: size,
      //       icon: GlobalVal.light,
      //       color: GlobalVal.yellow,
      //       boxColor: GlobalVal.box_yellow,
      //       text: "Off",
      //       textColor: GlobalVal.yellow,
      //     ),
      //     SizedBox(width: size.width * 0.01),
      //     ButtonWidget(
      //       title: "Cooler",
      //       size: size,
      //       icon: GlobalVal.cooler,
      //       color: GlobalVal.green,
      //       boxColor: GlobalVal.box_green,
      //       text: "Close",
      //       textColor: GlobalVal.green,
      //     ),
      //     // ButtonWidget(
      //     //   title: "Door",
      //     //   size: size,
      //     //   icon: GlobalVal.door,
      //     //   color: GlobalVal.blue,
      //     //   boxColor: GlobalVal.box_blue,
      //     //   text: "Close",
      //     //   textColor: GlobalVal.blue,
      //     // ),
      //     GaugeWidget(size: size, value: value),
      //     ElevatedButton(onPressed: () => gaugeData(), child: Text('Get'))
      //   ],
      // ),
    );
  }

  Future gaugeData() async {
    var response = await coll.get();
    var data = response.docs.first.data();
    value = data['age'].toDouble();
    print(data['age'].toString());
  }
}
