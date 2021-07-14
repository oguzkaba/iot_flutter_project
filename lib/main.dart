import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:iot_flutter_project/controller/dataController.dart';
import 'package:flutter/material.dart';
import 'package:iot_flutter_project/utils/globals.dart';
import 'package:iot_flutter_project/widgets/button.dart';
import 'package:iot_flutter_project/widgets/gauge.dart';

Future<void> main() async {
  // await GetStorage.init();
  runApp(MyApp());
}

//GetStorage Path:/data/data/com.example.onesystem/app_flutter/GetStorage.gs
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _fbase = Firebase.initializeApp();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.native,
        home: FutureBuilder(
            future: _fbase,
            builder: (context, snapshot) {
              // if (snapshot.data == null) {
              //   return Text('Data bulunamadı...');
              // }
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
CollectionReference<Map<String, dynamic>> coll = fstore.collection('temp');
DataController dc = Get.put(DataController());

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _gaugeData();
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
            _gaugeData();
            return Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ButtonWidget(
                      tapFunc: () => dc.lightValue.value = !dc.lightValue.value,
                      title: "Light",
                      size: size,
                      icon: GlobalVal.light,
                      color: dc.lightValue.value
                          ? GlobalVal.disabled
                          : GlobalVal.yellow,
                      boxColor: dc.lightValue.value
                          ? GlobalVal.box_disabled
                          : GlobalVal.box_yellow,
                      text: dc.lightValue.value ? "Off" : "On",
                      textColor: dc.changeView("light").last,
                    ),
                    SizedBox(width: size.width * 0.01),
                    ButtonWidget(
                      tapFunc: () =>
                          dc.coolerValue.value = !dc.coolerValue.value,
                      title: "Cooler",
                      size: size,
                      icon: GlobalVal.cooler,
                      color: GlobalVal.green,
                      boxColor: GlobalVal.box_green,
                      text: dc.coolerValue.value ? "Close" : "Open",
                      textColor: GlobalVal.green,
                    ),
                    ButtonWidget(
                      tapFunc: () => dc.doorValue.value = !dc.doorValue.value,
                      title: "Door",
                      size: size,
                      icon: GlobalVal.door,
                      color: GlobalVal.blue,
                      boxColor: GlobalVal.box_blue,
                      text: dc.doorValue.value ? "Close" : "Open",
                      textColor: GlobalVal.blue,
                    ),
                    GaugeWidget(size: size, value: dc.tempValue.value),
                  ],
                ));
            //_showListview(aSnapshots);dc.tempValue.value
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  ListView _showListview(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> aSnapshots) {
    return ListView.builder(
        itemCount: aSnapshots.data.docs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.folder),
            trailing: Text(aSnapshots.data.docs[index].data()['device_name']),
            title: Text(aSnapshots.data.docs[index].data()['temp'].toString()),
          );
        });
  }

  Future _gaugeData() async {
    var response = await coll.get();
    var data = response.docs.first.data();
    //setState(() => value = data['temp'].toDouble());
    dc.tempValue.value = data['temp'].toDouble();
    print(dc.tempValue.value.toString());
  }
}
