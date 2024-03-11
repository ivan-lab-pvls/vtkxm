import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:repair_mate_app/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/config.dart';
import 'model/ne.dart';
import 'pages/view_screen.dart';

int? initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: VTX.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await Notifi().activate();
  await VTXStar();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

late SharedPreferences prefVTX;
final rateVTX = InAppReview.instance;

Future<void> VTXStar() async {
  await getVTX();
  bool alred = prefVTX.getBool('vvtx') ?? false;
  if (!alred) {
    if (await rateVTX.isAvailable()) {
      rateVTX.requestReview();
      await prefVTX.setBool('vvtx', true);
    }
  }
}

Future<void> getVTX() async {
  prefVTX = await SharedPreferences.getInstance();
}

String repairData = '';
Future<bool> checkModelsForRepair() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();
  String value = remoteConfig.getString('dataForRepair');
  if (!value.contains('noneData')) {
    repairData = value;
  }
  return value.contains('noneData') ? false : true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: checkModelsForRepair(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: Center(
                child: Container(
                  height: 70,
                  width: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
            );
          } else {
            if (snapshot.data == true && repairData != '') {
              return PreviewwScreen(dataForPage: repairData);
            } else {
              return const SplashPage();
            }
          }
        },
      ),
    );
  }
}
