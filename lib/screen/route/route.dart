import 'package:get/get.dart';
import 'package:getx_firebase/controllers/bindings/authBinding.dart';
import 'package:getx_firebase/controllers/bindings/homeBinding.dart';
import 'package:getx_firebase/screen/homeScreenControl/qrScanPlant/qrScanPlant.dart';
import 'package:getx_firebase/screen/login_Signup/loginScreen.dart';
import 'package:getx_firebase/screen/login_Signup/signupScreen.dart';
import 'package:getx_firebase/screen/notificationScreen/notificationScreen.dart';
import 'package:getx_firebase/screen/searchScreen/searchScreen.dart';
import 'package:getx_firebase/screen/splashScreen/splashScreen.dart';

import '../homeScreenControl/homeScreen_Control.dart';

class AppRoute {
  static const INITIAL = '/SplashScreen';

  static final routes = [
    GetPage(
      name: Paths.SPLASHSCREEN,
      page: () => const SplashScreen(),
      binding: AuthBinding()
    ),
    GetPage(
      name: Paths.HOME,
      page: () => const HomeScreenControll(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.QRSCAN,
      page: () => QRViewExample(),
    ),
    GetPage(
      name: Paths.SEARCH,
      page: () => SearchScreen(),

    ),
    GetPage(
      name: Paths.LOGIN,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Paths.SIGNUP,
      page: () => const SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Paths.NOTIFI,
      page: () => const NotificationScreen(),
    ),
  ];

}
abstract class Paths {
  static const HOME = '/Home';
  static const SPLASHSCREEN = '/SplashScreen';
  static const QRSCAN = '/QrScan';
  static const SEARCH = '/Search';
  static const LOGIN = '/Login';
  static const SIGNUP = '/Signup';
  static const NOTIFI = '/Notifi';
}

