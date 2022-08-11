import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/bindings/authBinding.dart';
import 'package:getx_firebase/screen/login_Signup/loginScreen.dart';
import 'package:getx_firebase/screen/splashScreen/splashScreen.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';

// page controller để sử dụng và điều hướng homecontrol toàn app
late PageController pageController;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // init page controller để sử dụng toàn app
  pageController = PageController();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  static const MaterialColor mcgpalette0 = MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFE9F0EA),
    100: Color(0xFFC8DACB),
    200: Color(0xFFA4C2A9),
    300: Color(0xFF80AA86),
    400: Color(0xFF64976C),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFF427D4B),
    700: Color(0xFF397241),
    800: Color(0xFF316838),
    900: Color(0xFF215528),
  });
  static const int _mcgpalette0PrimaryValue = 0xFF498552;

  static const MaterialColor mcgpalette0Accent = MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFF98FFA5),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFF32FF4B),
    700: Color(0xFF19FF35),
  });
  static const int _mcgpalette0AccentValue = 0xFF65FF78;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
          builder: (context, orientation, deviceType) {
            return GetMaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: mcgpalette0,
              ),
              initialBinding: AuthBinding(),
              home: const SplashScreen(),
            );
          }
      );

  }
}

